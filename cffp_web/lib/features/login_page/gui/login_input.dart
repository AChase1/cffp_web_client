import 'package:cffp_web/constants/const_login.dart';
import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../functions/login_functions.dart';

class LoginInput extends ConsumerStatefulWidget {
  final String label;
  const LoginInput({
    super.key,
    required this.label,
  });

  @override
  ConsumerState<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends ConsumerState<LoginInput> {
  late FormFieldValidator? onValidate;
  late Function(String) onChanged;
  late bool showButton;

  @override
  void initState() {
    super.initState();
    if (widget.label == ConstLogin.username) {
      onValidate = (input) => LoginFunc.validateUsername(text: input);
      onChanged = (input) => LoginFunc.updateUsername(input: input, ref: ref);
      showButton = false;
    } else if (widget.label == ConstLogin.password) {
      onValidate = null;
      onChanged = (input) => LoginFunc.updatePassword(input: input, ref: ref);
      showButton = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyLabel(text: widget.label),
        const SizedBox(height: Sizing.mini),
        FieldInput(
          validator: (input) => onValidate?.call(input),
          onSubmit: (input) => LoginFunc.login(context: context, ref: ref),
          onChanged: (input) => onChanged(input),
          includeShowButton: showButton,
        ),
      ],
    );
  }
}
