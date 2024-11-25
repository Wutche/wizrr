import 'package:app/common/widgets/widget.bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  final String activePage;
  final Color backgroundColor;

  const HomeLayout({
    super.key,
    this.activePage = "home",
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomBar(activeTab: activePage),
    );
  }
}
