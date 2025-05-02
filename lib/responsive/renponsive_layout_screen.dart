import 'package:flutter/material.dart';
import 'package:threads_clone/utils/constent.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // If the screen is wider than 600 pixels, show the web layout
          return widget.webScreenLayout;
        } else {
          // Otherwise, show the mobile layout
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
