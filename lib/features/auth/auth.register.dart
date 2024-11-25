import 'package:app/common/layouts/layouts.auth.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/core/services/service.snackbar.dart';
import 'package:app/features/auth/widgets/auth.register_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String email = "";
  String password = "";
  String displayName = "";
  bool loading = false;

  setEmail(String value){
    setState(() {
      email = value;
    });
  }setPassword(String value){
    setState(() {
      password = value;
    });
  }
  setDisplayName(String value){
    setState(() {
      displayName = value;
    });
  }

  setLoading(bool value){
    setState(() {
      loading = value;
    });
  }

  handleSubmit() async{
    setLoading(true);
    await FirebaseAuthService
        .signUpUsers(
          displayName: displayName,
          email: email,
          password: password,
          onFinish: ()=>setLoading(false),
          onSuccess: (user){
            if(context.mounted){
              AppSnackBar.showDefaultSnackBar(context, "Account created Successfully");
              Future.delayed(const Duration(seconds: 10),(){
                context.go("/");
              });

            }
          },
          onError:(e){
            AppSnackBar.showDefaultSnackBar(context, e.toString());
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        pageTitle: "Create Account",
        child: Column(
          children: [
            RegisterForm(
                setDisplayName: setDisplayName,
                setEmail: setEmail,
                setPassword: setPassword,
                loading: loading,
                onSubmit: handleSubmit,
            ),
            const SizedBox(height: 24),
            Paragraph("Or", color: AppColor.darkShade[500]),
            const SizedBox(height: 8),
            // AppButton(
            //   action: (){},
            //   color: AppColor.dark.withOpacity(0.1),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset("assets/icons/google.png"),
            //       const SizedBox(width: 10,),
            //       Paragraph(
            //           "Continue With Google",
            //           size: ParagraphSizes.lg,
            //           color: AppColor.darkShade[800],
            //           weight: ParagraphWeight.medium,
            //       )
            //     ],
            //   ),
            // ),
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
