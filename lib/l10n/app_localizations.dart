import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Deal Dash'**
  String get appName;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Any shopping just from home'**
  String get appTitle;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 0.0.1'**
  String get appVersion;

  /// No description provided for @clothesTitle.
  ///
  /// In en, this message translates to:
  /// **'Style That Suits You'**
  String get clothesTitle;

  /// No description provided for @clothesDescription.
  ///
  /// In en, this message translates to:
  /// **'Browse the latest trends and timeless essentials. Find outfits that match your lifestyle'**
  String get clothesDescription;

  /// No description provided for @booksTitle.
  ///
  /// In en, this message translates to:
  /// **'Stories at Your Fingertips'**
  String get booksTitle;

  /// No description provided for @booksDescription.
  ///
  /// In en, this message translates to:
  /// **'From bestsellers to hidden gems, explore a world of knowledge and imagination.'**
  String get booksDescription;

  /// No description provided for @electronicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Power Up Your Life'**
  String get electronicsTitle;

  /// No description provided for @electronicsDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover cutting-edge gadgets and tech that make everyday living smarter and easier.'**
  String get electronicsDescription;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an Account'**
  String get alreadyHaveAccount;

  /// No description provided for @alreadyHaveAccountLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an Account? Login'**
  String get alreadyHaveAccountLogin;

  /// No description provided for @startShoppingAfterAccount.
  ///
  /// In en, this message translates to:
  /// **'Start shopping after creating your account'**
  String get startShoppingAfterAccount;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @createUsername.
  ///
  /// In en, this message translates to:
  /// **'Create your username'**
  String get createUsername;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rePassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get rePassword;

  /// No description provided for @rePasswordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm your Password'**
  String get rePasswordConfirm;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create your password'**
  String get createPassword;

  /// No description provided for @otherMethod.
  ///
  /// In en, this message translates to:
  /// **'Or using other methods'**
  String get otherMethod;

  /// No description provided for @signupWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up with Google'**
  String get signupWithGoogle;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @weSentEmail.
  ///
  /// In en, this message translates to:
  /// **'We have sent the verification code to'**
  String get weSentEmail;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @pleaseVerify.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email to continue to the app'**
  String get pleaseVerify;

  /// No description provided for @notReceivedCore.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get notReceivedCore;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'resend'**
  String get resend;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Register Success'**
  String get registerSuccess;

  /// No description provided for @congratulationsRegister.
  ///
  /// In en, this message translates to:
  /// **'Congratulation! your account already created.\nPlease verify your email and login to get amazing experience.'**
  String get congratulationsRegister;

  /// No description provided for @loginAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Login Account'**
  String get loginAccountTitle;

  /// No description provided for @loginAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please login with registered account'**
  String get loginAccountSubtitle;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmailAddress;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Signup'**
  String get dontHaveAccount;

  /// No description provided for @orUsingOtherMethod.
  ///
  /// In en, this message translates to:
  /// **'Or using other method'**
  String get orUsingOtherMethod;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @signUpWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign Up with Facebook'**
  String get signUpWithFacebook;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up with Google'**
  String get signUpWithGoogle;

  /// No description provided for @enterYourEmailOrPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mail or phone number'**
  String get enterYourEmailOrPhoneNumber;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty.'**
  String get errorEmptyField;

  /// No description provided for @errorValueTooLong.
  ///
  /// In en, this message translates to:
  /// **'Value is too long, maximum allowed is {length}.'**
  String errorValueTooLong(Object length);

  /// No description provided for @errorValueTooShort.
  ///
  /// In en, this message translates to:
  /// **'Must be at least {length} characters.'**
  String errorValueTooShort(Object length);

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get errorInvalidEmail;

  /// No description provided for @errorInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be strong.'**
  String get errorInvalidPassword;

  /// No description provided for @errorPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get errorPasswordMismatch;

  /// No description provided for @errorInvalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format.'**
  String get errorInvalidPhoneNumber;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @myCart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get myCart;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @letsShopping.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go shopping'**
  String get letsShopping;

  /// No description provided for @newArrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get newArrivals;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
