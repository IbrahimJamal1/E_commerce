class FirebaseErrorHandler {
  static String handle(String code) {
    switch (code) {
      // Auth
      case 'invalid-email':
        return 'The email address is invalid';

      case 'user-not-found':
        return 'No user found with this email';

      case 'wrong-password':
        return 'The password is incorrect';

      case 'invalid-credential':
        return 'Invalid email or password';

      case 'email-already-in-use':
        return 'This email is already in use';

      case 'weak-password':
        return 'The password is too weak';

      case 'user-disabled':
        return 'This user account has been disabled';

      case 'too-many-requests':
        return 'Too many requests. Try again later';

      case 'network-request-failed':
        return 'No internet connection';

      // Firestore
      case 'permission-denied':
        return 'You do not have permission to perform this action';

      case 'not-found':
        return 'The requested data was not found';

      case 'already-exists':
        return 'The data already exists';

      case 'deadline-exceeded':
        return 'The request took too long';

      case 'unavailable':
        return 'Firebase is currently unavailable';

      case 'unauthenticated':
        return 'You need to sign in first';

      // Storage
      case 'object-not-found':
        return 'The requested file was not found';

      case 'quota-exceeded':
        return 'Storage quota has been exceeded';

      case 'retry-limit-exceeded':
        return 'Upload failed. Please try again';

      default:
        return 'Something went wrong. Please try again';
    }
  }
}
