import 'package:app/common/widgets/widget.text.dart';
import 'package:app/core/core.colors.dart';
import 'package:app/core/enums/enum.paragraph.dart';
import 'package:flutter/material.dart';

class AppSnackBar{
  static showDefaultSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: AppColor.primary,
            elevation: 16,
            content: Paragraph(
                message,
                color: AppColor.white,
                weight: ParagraphWeight.medium,
                centered: false,
            )
        )
    );
  }

}