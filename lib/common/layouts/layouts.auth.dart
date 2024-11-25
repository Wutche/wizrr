import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  final String pageTitle;
  const AuthLayout({
    super.key,
    required this.pageTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColor.light,
        body: SafeArea(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage("assets/images/banner.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                children: [
                  Expanded(flex: 1,child: Container(),),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding:const EdgeInsets.symmetric(
                          vertical: 48,
                          horizontal: 24,
                        ) ,
                        width: double.infinity,
                        constraints: const BoxConstraints(
                            minHeight: 100
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(48),
                                topRight: Radius.circular(48)
                            )
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Paragraph(
                                pageTitle,
                                color: AppColor.dark,
                                size: ParagraphSizes.x4l,
                                weight: ParagraphWeight.bold,
                            ),
                            const SizedBox(height: 32),
                            Expanded(child: SingleChildScrollView(
                              child: child,
                            ))
                          ],
                        )
                      )),
                ],
              ),
            )
        )
    );
  }
}

