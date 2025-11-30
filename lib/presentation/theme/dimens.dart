class Dimensions {
  final double extraSmall;
  final double small;
  final double smallMedium;
  final double medium;
  final double mediumLarge;
  final double large;
  final double extraLarge;
  final double huge;
  final double extraHuge;
  final double massive;
  final double extraMassive;
  final double unexpected;

  const Dimensions({
    required this.extraSmall,
    required this.small,
    required this.smallMedium,
    required this.medium,
    required this.mediumLarge,
    required this.large,
    required this.extraLarge,
    required this.huge,
    required this.extraHuge,
    required this.massive,
    required this.extraMassive,
    required this.unexpected,
  });
}

const Dimensions smallDimensions = Dimensions(
  extraSmall: 4,
  small: 8,
  smallMedium: 12,
  medium: 16,
  mediumLarge: 24,
  large: 32,
  extraLarge: 36,
  huge: 42,
  extraHuge: 50,
  massive: 60,
  extraMassive: 90,
  unexpected: 125,
);

const Dimensions compactDimensions = Dimensions(
  extraSmall: 4,
  small: 8,
  smallMedium: 16,
  medium: 24,
  mediumLarge: 32,
  large: 42,
  extraLarge: 50,
  huge: 60,
  extraHuge: 75,
  massive: 90,
  extraMassive: 150,
  unexpected: 200,
);

const Dimensions mediumDimensions = Dimensions(
  extraSmall: 8,
  small: 12,
  smallMedium: 18,
  medium: 24,
  mediumLarge: 36,
  large: 48,
  extraLarge: 60,
  huge: 72,
  extraHuge: 90,
  massive: 120,
  extraMassive: 200,
  unexpected: 260,
);

const Dimensions largeDimensions = Dimensions(
  extraSmall: 12,
  small: 16,
  smallMedium: 24,
  medium: 36,
  mediumLarge: 48,
  large: 60,
  extraLarge: 75,
  huge: 90,
  extraHuge: 120,
  massive: 150,
  extraMassive: 225,
  unexpected: 300,
);
