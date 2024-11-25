import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleHeader extends StatelessWidget {
  final VoidCallback action;
  final String buttonText;
  final String title;
  const TitleHeader(this.title,{
    super.key,
    required this.action,
    this.buttonText = "See All"
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Paragraph(
            title,
            color: AppColor.black,
            size: ParagraphSizes.lg,
            weight: ParagraphWeight.bold,
          ),
          AppIconButton(
              tapHandler: action,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Paragraph(
                    buttonText,
                    color: AppColor.dark,
                    weight:ParagraphWeight.light,
                    size: ParagraphSizes.sm,
                  ),
                  const SizedBox(width: 4,),
                  const Icon(Icons.chevron_right)
                ],
              )
          )
        ]
    );
  }
}
