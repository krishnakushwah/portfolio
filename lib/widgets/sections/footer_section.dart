import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';

class FooterSection extends GetView<HomeController> {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
        border: Border(
          top: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: .08),
          ),
        ),
      ),
      child: Center(
        child: Container(
          padding: Responsive.pagePadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              if (!Responsive.isMobile(context))
                Row(
                  children: [
                    TextButton(
                      onPressed: () => controller.scrollTo(controller.aboutKey),
                      child: const Text('About'),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () =>
                          controller.scrollTo(controller.projectsKey),
                      child: const Text('Projects'),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () => controller.scrollTo(controller.contactKey),
                      child: const Text('Contact'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
