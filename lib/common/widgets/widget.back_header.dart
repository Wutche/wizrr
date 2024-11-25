import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackHeader extends StatelessWidget {
  final String title;
  const BackHeader(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AppIconButton(tapHandler:context.pop,child: const Icon(Icons.arrow_back)),
            const SizedBox(width: 16),
            Paragraph(title,
              color: AppColor.black,
              size: ParagraphSizes.xl,
              weight: ParagraphWeight.bold,
            ),
          ],
        ),
      )
    );
  }
}
