import 'package:app/common/layouts/layouts.auth.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/features/auth/widgets/auth.input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        pageTitle: "Reset Password",
        child: Column(
          children: [
            // const InputField(
            //   placeholder: "New Password",
            //   isPassword: true,
            //   icon: Icon(Icons.lock_outline),
            // ),
            // const SizedBox(height: 8,),
            // const InputField(
            //   placeholder: "Confirm Password",
            //   isPassword: true,
            //   icon: Icon(Icons.lock_outline),
            // ),
            const SizedBox(height: 8,),

            const SizedBox(height: 24,),
            AppButton(
              action: (){},
              color: AppColor.primary,
              child: Paragraph(
                "Reset Password",
                color: AppColor.white,
                size: ParagraphSizes.lg,
                weight: ParagraphWeight.medium,
              ),

            ),
          ],
        )
    );
  }
}
