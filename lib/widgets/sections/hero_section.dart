import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/adaptive_icon.dart';
import 'package:portfolio/widgets/common/app_button.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';

class HeroSection extends GetView<HomeController> {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return Container(
      key: controller.homeKey,
      width: double.infinity,
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      padding: EdgeInsets.only(top: mobile ? 116 : 130, bottom: 56),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          padding: Responsive.pagePadding(context),
          child: mobile
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroCopy(),
                    SizedBox(height: 34),
                    Reveal(
                      delay: Duration(milliseconds: 140),
                      child: _HeroMockup(),
                    ),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 7, child: _HeroCopy()),
                    SizedBox(width: 60),
                    Expanded(
                      flex: 5,
                      child: Reveal(
                        delay: Duration(milliseconds: 140),
                        child: _HeroMockup(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroCopy extends GetView<HomeController> {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return Reveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatusPill(),
          const SizedBox(height: 22),
          Text(
            '${PortfolioData.name}\n${PortfolioData.role}',
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: mobile ? 44 : 68),
          ),
          const SizedBox(height: 18),
          Text(
            PortfolioData.taglines.first,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: mobile ? 16 : 19),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AppButton(
                label: 'Download Resume',
                icon: Icons.download_rounded,
                onPressed: () => controller.openUrl(PortfolioData.resumePath),
              ),
              AppButton(
                label: 'Contact Me',
                icon: Icons.arrow_forward_rounded,
                outlined: true,
                onPressed: () => controller.scrollTo(controller.contactKey),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Wrap(
            spacing: 10,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.github,
                url: PortfolioData.github,
                label: 'GitHub',
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                url: PortfolioData.linkedIn,
                label: 'LinkedIn',
              ),
              _SocialIcon(
                icon: Icons.email_rounded,
                url: 'mailto:${PortfolioData.email}',
                label: 'Email',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text('${PortfolioData.experience} professional experience'),
        ],
      ),
    );
  }
}

class _SocialIcon extends GetView<HomeController> {
  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.label,
  });

  final Object icon;
  final String url;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: IconButton.filledTonal(
        onPressed: () => controller.openUrl(url),
        icon: AdaptiveIcon(icon, size: 18),
      ),
    );
  }
}

class _HeroMockup extends StatelessWidget {
  const _HeroMockup();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: AspectRatio(
        aspectRatio: 1.02,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 260,
                height: 420,
                decoration: BoxDecoration(
                  color: scheme.surface.withValues(alpha: .7),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: scheme.primary.withValues(alpha: .28),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: scheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_horiz_rounded),
                      ],
                    ),
                    const SizedBox(height: 28),
                    _MockLine(width: 150, color: scheme.primary),
                    const SizedBox(height: 12),
                    const _MockLine(width: 210),
                    const SizedBox(height: 8),
                    const _MockLine(width: 180),
                    const SizedBox(height: 28),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(
                          4,
                          (index) => _MockTile(index: index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GlassCard(
                padding: const EdgeInsets.all(18),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Release Quality',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 14),
                      _Metric(label: 'Performance', value: '96%'),
                      _Metric(label: 'Crash-free users', value: '99%'),
                      _Metric(label: 'Store ready', value: 'A+'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MockLine extends StatelessWidget {
  const _MockLine({required this.width, this.color});

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        color:
            color ??
            Theme.of(context).colorScheme.onSurface.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _MockTile extends StatelessWidget {
  const _MockTile({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.teal, Colors.indigo, Colors.amber, Colors.pink];
    return Container(
      decoration: BoxDecoration(
        color: colors[index].withValues(alpha: .18),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.apps_rounded, color: colors[index].shade400),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
