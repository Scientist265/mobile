String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter a password';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!password.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!password.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one digit';
  }
  if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }

  return null;
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter an email address';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return 'Please enter a valid email address';
  }
  return null;
}
