import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:flutter/material.dart';
import 'package:app/features/auth/widgets/auth.input.dart';


class RegisterForm extends StatefulWidget {

  final bool loading;
  final void Function(String) setEmail;
  final void Function() onSubmit;
  final void Function(String) setDisplayName;
  final void Function(String) setPassword;

  const RegisterForm({
    super.key,
    required this.setDisplayName,
    required this.setEmail,
    required this.setPassword,
    required this.onSubmit,
    this.loading = false
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passwordShown = false;
  togglePasswordVisibility(){
    setState(() {
      passwordShown = !passwordShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          setInput: widget.setDisplayName,
          placeholder: "Full Name",
          icon: const Icon(Icons.text_fields),
        ),
        InputField(
          setInput: widget.setEmail,
          margin: const EdgeInsets.symmetric(vertical: 10),
          placeholder: "Email",
          icon: const Icon(Icons.alternate_email),
        ),
        InputField(
          setInput: widget.setPassword,
          placeholder: "Password",
          isPassword: true,
          isPasswordShown: passwordShown,
          togglePasswordVisibility: togglePasswordVisibility,
          icon: const Icon(Icons.lock_outline),
        ),
        const SizedBox(height: 16,),
        widget.loading
            ? AppButton(
                  action: (){},
                  color: AppColor.grayShade[300] as Color,
                  child: Paragraph("loading ...", color: AppColor.inactive),

                )
            : AppButton(
              action: widget.onSubmit,
              color: AppColor.primary,
              child: Paragraph("Create Account", color: AppColor.white),

            )
       ,
      ],
    );
  }
}
