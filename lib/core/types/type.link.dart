
import 'package:flutter/material.dart';

class LinkDataObject {
  final String icon;
  final String text;
  final String key;
  final String activeIcon;

  LinkDataObject(
    this.text,{
      required this.key,
      required this.icon,
      required this.activeIcon
    }
  );
}