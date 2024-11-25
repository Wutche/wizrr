import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:app/core/services/service.firebase_auth.dart';
import 'package:app/features/splashscreen/splashscreen.utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreenUtils.setTimeOut(() {
      context.push("/splashscreen-theme");
    }, 4000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(child: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: 30,
              child: Icon(Icons.place,color: AppColor.white,size: 40),
            ),
            Paragraph(
                "Explorer App",
                color: AppColor.primary,
                size: ParagraphSizes.x2l,
                weight: ParagraphWeight.bold,
            )
          ],
        )
      )),
    );
  }
}
