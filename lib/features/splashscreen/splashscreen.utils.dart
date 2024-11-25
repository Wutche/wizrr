import 'package:flutter/material.dart';

class SplashScreenUtils{
    static Future<void> setTimeOut(VoidCallback callBack,int duration)async{
        await Future.delayed(Duration(
          milliseconds: duration,
        ),callBack);
    }
}
