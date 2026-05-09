import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/glass_card.dart';

class PortfolioNavbar extends GetView<HomeController> {
  const PortfolioNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Home', controller.homeKey),
      ('About', controller.aboutKey),
      ('Skills', controller.skillsKey),
      ('Experience', controller.experienceKey),
      ('Projects', controller.projectsKey),
      ('Contact', controller.contactKey),
    ];

    return Positioned(
      top: 18,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          padding: Responsive.pagePadding(context),
          child: GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => controller.scrollTo(controller.homeKey),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          PortfolioData.name.substring(0, 1),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (!Responsive.isMobile(context))
                        Text(
                          'Flutter Developer',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                if (Responsive.isMobile(context))
                  PopupMenuButton<GlobalKey>(
                    tooltip: 'Open navigation',
                    icon: const Icon(Icons.menu_rounded),
                    onSelected: controller.scrollTo,
                    itemBuilder: (_) => [
                      for (final item in items)
                        PopupMenuItem(value: item.$2, child: Text(item.$1)),
                    ],
                  )
                else
                  Wrap(
                    spacing: 4,
                    children: [
                      for (final item in items)
                        TextButton(
                          onPressed: () => controller.scrollTo(item.$2),
                          child: Text(item.$1),
                        ),
                    ],
                  ),
                const SizedBox(width: 4),
                Obx(
                  () => IconButton(
                    tooltip: controller.isDarkMode.value
                        ? 'Switch to light theme'
                        : 'Switch to dark theme',
                    onPressed: controller.toggleTheme,
                    icon: Icon(
                      controller.isDarkMode.value
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
