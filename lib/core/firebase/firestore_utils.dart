import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

/// Generic mapper that can be synchronous or asynchronous.
typedef SnapshotMapper<T> = FutureOr<T?> Function(DocumentSnapshot ds);

/// Paging result container.
class PagingData<T> {
  final List<T> items;
  final DocumentSnapshot? lastItem;
  final bool hasReachedEnd;

  PagingData({
    required this.items,
    required this.lastItem,
    required this.hasReachedEnd,
  });
}

/// Query operation model (Where / OrderBy).
abstract class QueryOperation {
  const QueryOperation();
}

class WhereEqualTo extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereEqualTo(this.field, this.value);
}

class WhereNotEqualTo extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereNotEqualTo(this.field, this.value);
}

class WhereGreaterThan extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereGreaterThan(this.field, this.value);
}

class WhereGreaterThanOrEqualTo extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereGreaterThanOrEqualTo(this.field, this.value);
}

class WhereLessThan extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereLessThan(this.field, this.value);
}

class WhereLessThanOrEqualTo extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereLessThanOrEqualTo(this.field, this.value);
}

class WhereIn extends QueryOperation {
  final String field;
  final List<dynamic> values;
  const WhereIn(this.field, this.values);
}

class WhereArrayContains extends QueryOperation {
  final String field;
  final dynamic value;
  const WhereArrayContains(this.field, this.value);
}

class OrderBy extends QueryOperation {
  final String field;
  final bool descending;
  const OrderBy(this.field, {this.descending = false});
}

/// Firestore utilities supporting nested collections, queries, realtime, pagination.
class FirebaseUtils {
  final FirebaseFirestore firestore;

  FirebaseUtils(this.firestore);

  // -------------------------
  // Helpers for path building
  // -------------------------

  /// Build a DocumentReference from an even-length path:
  /// ["collection", "docId", "subCollection", "subDocId", ...]
  DocumentReference _documentRefFromPath(List<String> pathSegments) {
    if (pathSegments.length < 2 || pathSegments.length % 2 != 0) {
      throw ArgumentError(
          'Document path must be even length and at least 2 (collection, doc).');
    }

    var docRef = firestore.collection(pathSegments[0]).doc(pathSegments[1]);
    for (var i = 2; i < pathSegments.length; i += 2) {
      final coll = pathSegments[i];
      final doc = pathSegments[i + 1];
      docRef = docRef.collection(coll).doc(doc);
    }
    return docRef;
  }

  /// Build a CollectionReference from an odd-length path:
  /// ["collection"] or ["collection", "docId", "subCollection", ...]
  CollectionReference _collectionRefFromPath(List<String> pathSegments) {
    if (pathSegments.isEmpty) {
      throw ArgumentError('Collection path must not be empty.');
    }
    if (pathSegments.length == 1) {
      return firestore.collection(pathSegments[0]);
    }
    // must be odd length: collection, doc, collection, doc, collection ...
    if (pathSegments.length % 2 == 0) {
      throw ArgumentError(
          'Collection path must end with a collection name (odd length).');
    }

    CollectionReference col = firestore.collection(pathSegments[0]);
    for (var i = 1; i < pathSegments.length; i += 2) {
      final doc = pathSegments[i];
      final nextCollection = pathSegments[i + 1];
      col = col.doc(doc).collection(nextCollection);
    }
    return col;
  }

  // -------------------------
  // Basic helpers
  // -------------------------

  String generateId(String collectionName) =>
      firestore.collection(collectionName).doc().id;

  Future<bool> documentExists(List<String> documentPath) async {
    final ref = _documentRefFromPath(documentPath);
    final snap = await ref.get();
    return snap.exists;
  }

  Future<DocumentSnapshot> getDocumentSnapshot(List<String> documentPath) {
    final ref = _documentRefFromPath(documentPath);
    return ref.get();
  }

  // -------------------------
  // Save / Get / Delete
  // -------------------------

  /// Save an item to a collection path (collection path must end with a collection name).
  /// Example paths:
  ///  - ["posts"] -> top-level posts collection
  ///  - ["users", "uid", "posts"] -> nested collection users/{uid}/posts
  Future<DocumentReference> saveDocument({
    required List<String> collectionPath,
    String? documentId,
    required Map<String, dynamic> data,
  }) async {
    final collectionRef = _collectionRefFromPath(collectionPath);

    if (documentId != null) {
      final docRef = collectionRef.doc(documentId);
      await docRef.set(data);
      return docRef;
    } else {
      final docRef = await collectionRef.add(data);
      return docRef;
    }
  }

  Future<T?> getItem<T>({
    required List<String> documentPath,
    required SnapshotMapper<T> mapper,
  }) async {
    final snap = await _documentRefFromPath(documentPath).get();
    final mapped = await Future.sync(() => mapper(snap));
    return mapped;
  }

  /// Get all items from a collection (supports optional query operations & limit).
  Future<List<T>> getAllItems<T>({
    required List<String> collectionPath,
    List<QueryOperation>? queryOperations,
    int? limit,
    required SnapshotMapper<T> mapper,
  }) async {
    var query = _collectionRefFromPath(collectionPath).withConverter<Object>(
      fromFirestore: (s, _) => s.data() ?? <String, dynamic>{},
      toFirestore: (_, __) => <String, dynamic>{},
    ) as Query; // keep as Query for chaining

    query = _applyQueryOperations(query, queryOperations);

    if (limit != null) {
      query = query.limit(limit);
    }

    final snapshot = await query.get();
    final results = await Future.wait(
        snapshot.docs.map((d) => Future.sync(() => mapper(d))).toList());
    return results.whereType<T>().toList();
  }

  /// Real-time stream of mapped items from a collection with optional query operations.
  Stream<List<T>> getItemsInRealTimeStream<T>({
    required List<String> collectionPath,
    List<QueryOperation>? queryOperations,
    required SnapshotMapper<T> mapper,
  }) {
    var query = _collectionRefFromPath(collectionPath).withConverter<Object>(
      fromFirestore: (s, _) => s.data() ?? <String, dynamic>{},
      toFirestore: (_, __) => <String, dynamic>{},
    ) as Query;

    query = _applyQueryOperations(query, queryOperations);

    return query.snapshots().asyncMap((snapshot) async {
      final mapped = await Future.wait(
          snapshot.docs.map((d) => Future.sync(() => mapper(d))).toList());
      return mapped.whereType<T>().toList();
    });
  }

  // -------------------------
  // Pagination (simple)
  // -------------------------

  /// Simple pagination returning the page and the last document snapshot.
  Future<PagingData<T>> getPaginatedItems<T>({
    required List<String> collectionPath,
    required int limit,
    List<QueryOperation>? queryOperations,
    DocumentSnapshot? lastDocument,
    required SnapshotMapper<T> mapper,
  }) async {
    var query = _collectionRefFromPath(collectionPath).withConverter<Object>(
      fromFirestore: (s, _) => s.data() ?? <String, dynamic>{},
      toFirestore: (_, __) => <String, dynamic>{},
    ) as Query;

    query = _applyQueryOperations(query, queryOperations);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }
    query = query.limit(limit);

    final snapshot = await query.get();
    final results = await Future.wait(
        snapshot.docs.map((d) => Future.sync(() => mapper(d))).toList());

    final items = results.whereType<T>().toList();
    final lastDoc = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
    final hasReachedEnd = items.length < limit;

    return PagingData(items: items, lastItem: lastDoc, hasReachedEnd: hasReachedEnd);
  }

  // -------------------------
  // Update / Counters / Delete
  // -------------------------

  Future<DocumentReference> updateFields({
    required List<String> documentPath,
    required Map<String, dynamic> updates,
  }) async {
    final ref = _documentRefFromPath(documentPath);
    await ref.update(updates);
    return ref;
  }

  Future<DocumentReference> updateCount({
    required List<String> documentPath,
    required String field,
    bool increment = true,
  }) async {
    final ref = _documentRefFromPath(documentPath);
    await ref.update({field: FieldValue.increment(increment ? 1 : -1)});
    return ref;
  }

  Future<bool> deleteDocument(List<String> documentPath) async {
    final ref = _documentRefFromPath(documentPath);
    await ref.delete();
    return true;
  }

  // -------------------------
  // Transactions & Batches
  // -------------------------

  /// Run a transaction. The provided [transactionHandler] receives a Transaction
  /// object and can perform reads and writes. It must be async and return a value or null.
  Future<T> runTransaction<T>(
      Future<T> Function(Transaction transaction) transactionHandler) {
    return firestore.runTransaction<T>((tx) async {
      return transactionHandler(tx);
    });
  }

  /// Run a batch. Pass a function that receives WriteBatch to populate writes.
  Future<void> runBatch(FutureOr<void> Function(WriteBatch batch) batchHandler) async {
    final batch = firestore.batch();
    await Future.sync(() => batchHandler(batch));
    await batch.commit();
  }

  // -------------------------
  // Internal: apply query operations
  // -------------------------

  Query _applyQueryOperations(Query query, List<QueryOperation>? ops) {
    if (ops == null || ops.isEmpty) return query;

    for (final op in ops) {
      if (op is WhereEqualTo) {
        query = query.where(op.field, isEqualTo: op.value);
      } else if (op is WhereNotEqualTo) {
        query = query.where(op.field, isNotEqualTo: op.value);
      } else if (op is WhereGreaterThan) {
        query = query.where(op.field, isGreaterThan: op.value);
      } else if (op is WhereGreaterThanOrEqualTo) {
        query = query.where(op.field, isGreaterThanOrEqualTo: op.value);
      } else if (op is WhereLessThan) {
        query = query.where(op.field, isLessThan: op.value);
      } else if (op is WhereLessThanOrEqualTo) {
        query = query.where(op.field, isLessThanOrEqualTo: op.value);
      } else if (op is WhereIn) {
        // use where(..., whereIn: ...) parameter
        query = query.where(op.field, whereIn: op.values);
      } else if (op is WhereArrayContains) {
        query = query.where(op.field, arrayContains: op.value);
      } else if (op is OrderBy) {
        query = query.orderBy(op.field, descending: op.descending);
      }
    }
    return query;
  }
}
