import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';
import 'package:portfolio/widgets/common/section_shell.dart';

class ExperienceSection extends GetView<HomeController> {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: controller.experienceKey,
      eyebrow: 'Experience',
      title: 'Three years of professional Flutter delivery.',
      subtitle:
          'Experience across app architecture, UI delivery, REST integrations, Firebase features, testing fixes, performance tuning, and production publishing.',
      child: Column(
        children: const [
          Reveal(
            child: _TimelineItem(
              period: 'Year 1',
              title: 'Flutter Application Development',
              body:
                  'Built production screens, reusable widgets, GetX state flows, responsive layouts, and API-connected user journeys.',
            ),
          ),
          Reveal(
            delay: Duration(milliseconds: 100),
            child: _TimelineItem(
              period: 'Year 2',
              title: 'Scalable Apps and Store Releases',
              body:
                  'Worked on production apps including UBIATT, UBI HRM, and UBI School with app publishing support for Play Store and App Store.',
            ),
          ),
          Reveal(
            delay: Duration(milliseconds: 200),
            child: _TimelineItem(
              period: 'Year 3',
              title: 'Architecture and Performance Ownership',
              body:
                  'Focused on clean architecture, maintainability, performance optimization, Firebase integration, release readiness, and professional UI polish.',
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.period,
    required this.title,
    required this.body,
  });

  final String period;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 92,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: .22),
              ),
            ],
          ),
          const SizedBox(width: 18),
          Expanded(
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    period,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(body, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
