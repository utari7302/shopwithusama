class UFirebaseAuthException implements Exception {

  /// Error code associated with exception
  final String code;

  /// Constructor that takes an error code
  UFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error data
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address is not valid. Please check the format and try again.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'There is no user corresponding to this identifier. The user may have been deleted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'invalid-verification-code':
        return 'The verification code used to verify the phone number is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID used to verify the phone number is invalid.';
      case 'quota-exceeded':
        return 'The quota for this operation has been exceeded. Please try again later.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different credential';
      case 'invalid-credential':
        return 'The supplied auth credential is malformed or has expired.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}