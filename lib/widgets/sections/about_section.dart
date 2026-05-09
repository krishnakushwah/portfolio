import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';
import 'package:portfolio/widgets/common/section_shell.dart';

class AboutSection extends GetView<HomeController> {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return SectionShell(
      sectionKey: controller.aboutKey,
      eyebrow: 'About me',
      title:
          'A Flutter developer focused on production quality and clean delivery.',
      subtitle: PortfolioData.professionalBio,
      child: Reveal(
        child: GridView.count(
          crossAxisCount: mobile ? 1 : 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: mobile ? 2.8 : 1.25,
          children: const [
            _AboutFact(
              value: 3,
              suffix: '+',
              label: 'Years building Flutter apps',
            ),
            _AboutFact(value: 2, label: 'Store ecosystems shipped'),
            _AboutFact(textValue: 'GetX', label: 'State, routing, and DI'),
            _AboutFact(textValue: 'Clean', label: 'Maintainable architecture'),
          ],
        ),
      ),
    );
  }
}

class _AboutFact extends StatelessWidget {
  const _AboutFact({
    required this.label,
    this.value,
    this.suffix = '',
    this.textValue,
  });

  final int? value;
  final String suffix;
  final String? textValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _AnimatedFactValue(value: value, suffix: suffix, textValue: textValue),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _AnimatedFactValue extends StatelessWidget {
  const _AnimatedFactValue({this.value, this.suffix = '', this.textValue});

  final int? value;
  final String suffix;
  final String? textValue;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displayMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 34,
    );
    if (value == null) return Text(textValue ?? '', style: style);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value!.toDouble()),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, animated, _) {
        return Text('${animated.round()}$suffix', style: style);
      },
    );
  }
}
