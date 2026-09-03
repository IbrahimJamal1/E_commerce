class Validation {
  static String? validatename(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validatepasswordlogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Simple email regex pattern
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatephone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pehon is required';
    }
    final phonereg = RegExp(
      r'^(\+\d{1,3}[- ]?)?\(?\d{1,3}\)?[- ]?\d{3,4}[- ]?\d{4}$',
    );

    if (!phonereg.hasMatch(value)) {
      return 'Enter a valid Phone Number';
    }
    return null;
  }

  static String? validatePasswordregister(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }
}
