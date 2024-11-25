import 'package:app/common/layouts/layouts.auth.dart';
import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/core/services/service.snackbar.dart';
import 'package:app/features/auth/widgets/auth.login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
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
  setLoading(bool value){
    setState(() {
      loading = value;
    });
  }

  handleSubmit() async{
    setLoading(true);
      var res = await FirebaseAuthService.signInUser(email, password, onFinish: ()=>setLoading(false));
      if(!context.mounted) return;
      if(res.user == null){
        AppSnackBar.showDefaultSnackBar(context, res.error.toString());
        return;
      }
      context.go("/");
  }
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        pageTitle: "Login",
        child: Column(
          children: [
            LoginForm(setEmail: setEmail, setPassword: setPassword, onSubmit: handleSubmit),
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
            //         "Continue With Google",
            //         size: ParagraphSizes.lg,
            //         color: AppColor.darkShade[800],
            //         weight: ParagraphWeight.medium,
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 8),
            AppButton(
              action: (){
                context.push("/create-account");
              },
              outlined: true,
              color: AppColor.dark,
              child: Paragraph(
                "Create Account",
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
