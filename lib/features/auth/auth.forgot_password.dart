import 'package:app/common/layouts/layouts.auth.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/features/auth/widgets/auth.input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        pageTitle: "Forgot Password",
        child: Column(
          children: [
            // const InputField(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   placeholder: "Email",
            //   icon: Icon(Icons.alternate_email),
            // ),
            const SizedBox(height: 16,),
            AppButton(
              action: (){
                context.push("/reset-password");
              },
              color: AppColor.primary,
              child: Paragraph(
                "Submit",
                color: AppColor.white,
                size: ParagraphSizes.lg,
                weight: ParagraphWeight.medium,
              ),

            ),
            const SizedBox(height: 24),
            Paragraph("Or", color: AppColor.darkShade[500]),
            const SizedBox(height: 8),
            AppButton(
              action: (){},
              color: AppColor.dark.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/google.png"),
                  const SizedBox(width: 10,),
                  Paragraph(
                    "Continue With Google",
                    size: ParagraphSizes.lg,
                    color: AppColor.darkShade[800],
                    weight: ParagraphWeight.medium,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            AppButton(
              action: (){
                context.push("/login");
              },
              outlined: true,
              color: AppColor.dark,
              child: Paragraph(
                "Login Instead",
                size: ParagraphSizes.lg,
                color: AppColor.darkShade[800],
                weight: ParagraphWeight.medium,
              ),
            ),

          ],
        )
    );
  }
}
