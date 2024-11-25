import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/features/splashscreen/splashscreen.utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenThemePage extends StatefulWidget {
  const SplashScreenThemePage({super.key});

  @override
  State<SplashScreenThemePage> createState() => _SplashScreenThemePageState();
}

class _SplashScreenThemePageState extends State<SplashScreenThemePage> {
  checkAuthState(){
    var user = FirebaseAuthService.getCurrentUser();
    if(!context.mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(user == null){
        context.go("/login");
        return;
      }
      context.go("/");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuthState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 30,
              child: Icon(Icons.place,color: AppColor.primary,size: 40),
            ),
            Paragraph(
              "Explorer App",
              color: AppColor.white,
              size: ParagraphSizes.x2l,
              weight: ParagraphWeight.bold,
            )
          ],
        )
      )),
    );
  }
}
