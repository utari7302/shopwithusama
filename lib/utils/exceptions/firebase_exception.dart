class UFirebaseException implements Exception {

  /// Error code associated with exception
  final String code;

  /// Constructor that takes an error code
  UFirebaseException(this.code);

  /// Get the corresponding error message based on the error data
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-credential':
        return 'The supplied auth credential is malformed or has expired.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please enable it in the Firebase console.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}