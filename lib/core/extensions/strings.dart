

String formatPhoneNumber(String value) {
  // Remove any non-digit characters and add the extension
  final subValue = value.split(' ');
  String digitsOnly = subValue.first.replaceAll(RegExp(r'\D'), '');
  return digitsOnly;
}