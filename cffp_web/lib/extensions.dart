import 'package:cffp_web/constants/const_validators.dart';

extension StringExt on String {
  String? isEmail() => validate(
      regex: Validate.email, errorText: "Must be a valid email address");

  String? validate({
    required String regex,
    String errorText = "Text is not valid",
  }) =>
      RegExp(regex).hasMatch(this) ? null : errorText;
}
