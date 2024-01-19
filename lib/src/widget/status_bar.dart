import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/colors.dart';

enum StatusBarType { light, dark }

extension StatusBarTypeExtension on StatusBarType {
  bool get isLight => this == StatusBarType.light;
  bool get isDark => this == StatusBarType.dark;
}

class StatusBar extends StatelessWidget {
  final StatusBarType statusBarType;
  final Widget child;

  const StatusBar({
    Key? key,
    required this.child,
  })  : statusBarType = StatusBarType.light,
        super(key: key);

  const StatusBar.dark({
    Key? key,
    required this.child,
  })  : statusBarType = StatusBarType.dark,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.black,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
