import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/features/auth/widgets/auth.input.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {

  final bool loading;
  final void Function(String) setEmail;
  final void Function(String) setPassword;
  final void Function() onSubmit;
  const LoginForm({
    super.key,
    required this.setEmail,
    required this.setPassword,
    required this.onSubmit,
    this.loading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                context.push("/forgot-password");
              },
              child: Paragraph(
                "Forgot Password?",
                size: ParagraphSizes.lg,
                color: AppColor.darkShade[800],
                weight: ParagraphWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        widget.loading
            ? AppButton(
          action: (){},
          color: AppColor.grayShade[300] as Color,
          child: Paragraph("Loading ...", color: AppColor.inactive),

        )
            : AppButton(
          action: widget.onSubmit,
          color: AppColor.primary,
          child: Paragraph("Login", color: AppColor.white),

        )
        ,
      ],
    );
  }
}
