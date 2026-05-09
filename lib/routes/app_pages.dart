import 'package:get/get.dart';
import 'package:portfolio/views/home/home_view.dart';

abstract class AppRoutes {
  static const home = '/';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
  ];
}
