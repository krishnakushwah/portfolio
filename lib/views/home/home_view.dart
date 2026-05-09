import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/widgets/sections/about_section.dart';
import 'package:portfolio/widgets/sections/achievements_section.dart';
import 'package:portfolio/widgets/sections/contact_section.dart';
import 'package:portfolio/widgets/sections/experience_section.dart';
import 'package:portfolio/widgets/sections/footer_section.dart';
import 'package:portfolio/widgets/sections/hero_section.dart';
import 'package:portfolio/widgets/sections/navbar.dart';
import 'package:portfolio/widgets/sections/projects_section.dart';
import 'package:portfolio/widgets/sections/skills_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Background(),
          SelectionArea(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: const [
                  HeroSection(),
                  AboutSection(),
                  SkillsSection(),
                  ExperienceSection(),
                  ProjectsSection(),
                  AchievementsSection(),
                  ContactSection(),
                  FooterSection(),
                ],
              ),
            ),
          ),
          const PortfolioNavbar(),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? const [
                    Color(0xFF07111E),
                    Color(0xFF101827),
                    Color(0xFF071A1D),
                  ]
                : const [
                    Color(0xFFF6F8FB),
                    Color(0xFFEFF8F7),
                    Color(0xFFFFFFFF),
                  ],
          ),
        ),
      ),
    );
  }
}
