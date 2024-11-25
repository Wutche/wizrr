import 'package:flutter/material.dart';

class AppModal {
  static showCustomModal(BuildContext context, Widget child){
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        pageBuilder: (context, animation, secondaryAnimation){
          return child;
        }
    );
  }

}