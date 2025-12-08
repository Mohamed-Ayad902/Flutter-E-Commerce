import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Deal Dash';

  @override
  String get appTitle => 'Any shopping just from home';

  @override
  String get appVersion => 'Version 0.0.1';

  @override
  String get clothesTitle => 'Style That Suits You';

  @override
  String get clothesDescription => 'Browse the latest trends and timeless essentials. Find outfits that match your lifestyle';

  @override
  String get booksTitle => 'Stories at Your Fingertips';

  @override
  String get booksDescription => 'From bestsellers to hidden gems, explore a world of knowledge and imagination.';

  @override
  String get electronicsTitle => 'Power Up Your Life';

  @override
  String get electronicsDescription => 'Discover cutting-edge gadgets and tech that make everyday living smarter and easier.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an Account';

  @override
  String get alreadyHaveAccountLogin => 'Already have an Account? Login';

  @override
  String get startShoppingAfterAccount => 'Start shopping after creating your account';

  @override
  String get username => 'Username';

  @override
  String get createUsername => 'Create your username';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter your email address';

  @override
  String get password => 'Password';

  @override
  String get rePassword => 'Confirm Password';

  @override
  String get rePasswordConfirm => 'Confirm your Password';

  @override
  String get createPassword => 'Create your password';

  @override
  String get otherMethod => 'Or using other methods';

  @override
  String get signupWithGoogle => 'Sign Up with Google';

  @override
  String get verification => 'Verification';

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get weSentEmail => 'We have sent the verification code to';

  @override
  String get submit => 'Submit';

  @override
  String get pleaseVerify => 'Please verify your email to continue to the app';

  @override
  String get notReceivedCore => 'Didn\'t receive the code?';

  @override
  String get resend => 'resend';

  @override
  String get registerSuccess => 'Register Success';

  @override
  String get congratulationsRegister => 'Congratulation! your account already created.\nPlease verify your email and login to get amazing experience.';

  @override
  String get loginAccountTitle => 'Login Account';

  @override
  String get loginAccountSubtitle => 'Please login with registered account';

  @override
  String get emailAddress => 'Email address';

  @override
  String get enterEmailAddress => 'Enter your email address';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Signup';

  @override
  String get orUsingOtherMethod => 'Or using other method';

  @override
  String get signInWithGoogle => 'Sign In with Google';

  @override
  String get signInWithFacebook => 'Sign In with Facebook';

  @override
  String get signUpWithFacebook => 'Sign Up with Facebook';

  @override
  String get signUpWithGoogle => 'Sign Up with Google';

  @override
  String get enterYourEmailOrPhoneNumber => 'Enter your mail or phone number';

  @override
  String get sendCode => 'Send Code';

  @override
  String get errorEmptyField => 'This field cannot be empty.';

  @override
  String errorValueTooLong(Object length) {
    return 'Value is too long, maximum allowed is $length.';
  }

  @override
  String errorValueTooShort(Object length) {
    return 'Must be at least $length characters.';
  }

  @override
  String get errorInvalidEmail => 'Please enter a valid email address.';

  @override
  String get errorInvalidPassword => 'Password must be strong.';

  @override
  String get errorPasswordMismatch => 'Passwords do not match.';

  @override
  String get errorInvalidPhoneNumber => 'Invalid phone number format.';

  @override
  String get home => 'Home';

  @override
  String get myCart => 'My Cart';

  @override
  String get favorite => 'Favorite';

  @override
  String get myProfile => 'My Profile';

  @override
  String get category => 'Category';

  @override
  String get letsShopping => 'Let\'s go shopping';

  @override
  String get newArrivals => 'New Arrivals';

  @override
  String get seeAll => 'See All';
}
