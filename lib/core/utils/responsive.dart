import 'package:flutter/widgets.dart';

enum DeviceSize { mobile, tablet, desktop }

class Responsive {
  static DeviceSize device(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 700) return DeviceSize.mobile;
    if (width < 1100) return DeviceSize.tablet;
    return DeviceSize.desktop;
  }

  static bool isMobile(BuildContext context) =>
      device(context) == DeviceSize.mobile;

  static double maxWidth(BuildContext context) {
    switch (device(context)) {
      case DeviceSize.mobile:
        return double.infinity;
      case DeviceSize.tablet:
        return 920;
      case DeviceSize.desktop:
        return 1180;
    }
  }

  static EdgeInsets pagePadding(BuildContext context) {
    switch (device(context)) {
      case DeviceSize.mobile:
        return const EdgeInsets.symmetric(horizontal: 20);
      case DeviceSize.tablet:
        return const EdgeInsets.symmetric(horizontal: 36);
      case DeviceSize.desktop:
        return const EdgeInsets.symmetric(horizontal: 56);
    }
  }
}
