import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final VoidCallback tapHandler;
  final double? height;

  const AppIconButton({
    super.key,
    required this.tapHandler,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapHandler,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [child],
        ),
      ),
    );
  }
}
