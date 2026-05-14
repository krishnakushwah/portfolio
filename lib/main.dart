import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/routes/app_pages.dart';
import 'package:portfolio/views/home/home_binding.dart';
import 'package:portfolio/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Krishna | Flutter Developer',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    );
  }
}
