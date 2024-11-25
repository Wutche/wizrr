import 'package:app/common/widgets/widget.button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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
                Expanded(flex: 3,child: Container(),),
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
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
                              "Explore With Us",
                              color: AppColor.primary,
                              size: ParagraphSizes.x6l,
                              weight: ParagraphWeight.bold,
                            ),
                            Paragraph(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                              color: AppColor.black,
                              size: ParagraphSizes.md,
                              weight: ParagraphWeight.light,
                              centered: false,
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    action: (){
                                      context.push("/create-account");
                                    },
                                    color: AppColor.primary,
                                    child: Paragraph(
                                      "Create Account",
                                      color: AppColor.white,
                                      size: ParagraphSizes.lg,
                                      weight:ParagraphWeight.medium,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    action: (){
                                      context.push("/login");
                                    },
                                    outlined: true,
                                    color: AppColor.black,
                                    child: Paragraph(
                                      "Login Instead",
                                      color: AppColor.darkShade[600],
                                      size: ParagraphSizes.lg,
                                      weight:ParagraphWeight.medium,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ) ,
                      ),
                    )),
              ],
            ),
              )
          )
      );
  }
}

