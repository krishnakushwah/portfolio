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
      padding: const EdgeInsets.symmetric(vertical: 34),
      decoration: BoxDecoration(
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
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          padding: Responsive.pagePadding(context),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 18,
            children: [
              Text('(c) 2026 ${PortfolioData.name}. Flutter Developer.'),
              Wrap(
                spacing: 6,
                children: [
                  TextButton(
                    onPressed: () => controller.scrollTo(controller.aboutKey),
                    child: const Text('About'),
                  ),
                  TextButton(
                    onPressed: () =>
                        controller.scrollTo(controller.projectsKey),
                    child: const Text('Projects'),
                  ),
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
