/// additonal logic for string objects
extension ExtString on String? {
  bool isEmptyOrNull() => (this?.isEmpty ?? true);
  String returnIfEmptyOrNull({required String text}) =>
      isEmptyOrNull() ? text : (this ?? "");

  String? validate({
    required String regex,
    String errorText = "Text is not valid",
  }) =>
      RegExp(regex).hasMatch(this ?? '') ? null : errorText;
}
