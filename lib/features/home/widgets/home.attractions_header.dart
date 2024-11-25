import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.colors.dart';

class AttractionsHeader extends StatelessWidget {
  const AttractionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Paragraph(
              "Popular Attractions",
              color: AppColor.black,
              size: ParagraphSizes.lg,
              weight: ParagraphWeight.bold,
            ),
            AppIconButton(
                tapHandler: (){
                  context.push("/attractions");
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Paragraph(
                      "See All",
                      color: AppColor.dark,
                      weight:ParagraphWeight.light,
                      size: ParagraphSizes.sm,
                    ),
                    const SizedBox(width: 4,),
                    const Icon(Icons.chevron_right)
                  ],
                )
            )
          ],
        ));
  }
}
