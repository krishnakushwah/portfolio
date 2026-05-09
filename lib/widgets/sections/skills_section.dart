import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/adaptive_icon.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';
import 'package:portfolio/widgets/common/section_shell.dart';

class SkillsSection extends GetView<HomeController> {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return SectionShell(
      sectionKey: controller.skillsKey,
      eyebrow: 'Skills',
      title: 'Core Flutter capabilities recruiters look for.',
      subtitle:
          'A practical stack for building scalable, store-ready applications with stable APIs, polished UI, and maintainable code.',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: PortfolioData.skills.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mobile ? 1 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: mobile ? 3.3 : 2.5,
        ),
        itemBuilder: (context, index) {
          final skill = PortfolioData.skills[index];
          return Reveal(
            delay: Duration(milliseconds: index * 45),
            child: _SkillCard(
              icon: skill.icon,
              name: skill.name,
              note: skill.note,
            ),
          );
        },
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  const _SkillCard({
    required this.icon,
    required this.name,
    required this.note,
  });

  final Object icon;
  final String name;
  final String note;

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedScale(
        scale: hovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 180),
        child: GlassCard(
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .16),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AdaptiveIcon(
                  widget.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.note,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
