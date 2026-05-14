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
      'Building scalable Flutter apps with clean architecture and modern UI engineering.',
      subtitle:
      'Flutter Developer with 3 years of experience building scalable Android, iOS, and web applications. Specialized in GetX, Firebase, REST APIs, clean architecture, and responsive UI development with a strong focus on performance and maintainability.',

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 28),

          /// CTA + STATUS
          // Wrap(
          //   spacing: 16,
          //   runSpacing: 16,
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 16,
          //         vertical: 12,
          //       ),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Theme.of(
          //           context,
          //         ).colorScheme.primary.withOpacity(0.08),
          //         border: Border.all(
          //           color: Theme.of(
          //             context,
          //           ).colorScheme.primary.withOpacity(0.2),
          //         ),
          //       ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Container(
          //             width: 10,
          //             height: 10,
          //             decoration: const BoxDecoration(
          //               color: Colors.greenAccent,
          //               shape: BoxShape.circle,
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //           Text(
          //             'Available for freelance work',
          //             style: TextStyle(
          //               color: Theme.of(context).colorScheme.primary,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //
          //     // OutlinedButton.icon(
          //     //   onPressed: () {
          //     //     /// ADD RESUME DOWNLOAD
          //     //   },
          //     //   icon: const Icon(Icons.download_rounded),
          //     //   label: const Text('Download Resume'),
          //     // ),
          //   ],
          // ),
          //
          // const SizedBox(height: 42),

          /// FACT CARDS
          Reveal(
            child: GridView.count(
              crossAxisCount: mobile ? 1 : 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: mobile ? 2.8 : 1.8,
              children: const [
                _AboutFact(
                  icon: Icons.workspace_premium_rounded,
                  value: 3,
                  suffix: '+',
                  label: 'Years Experience',
                ),
                _AboutFact(
                  icon: Icons.rocket_launch_rounded,
                  value: 3  ,
                  suffix: '+',
                  label: 'Apps Delivered',
                ),
                _AboutFact(
                  icon: Icons.hub_rounded,
                  textValue: 'GetX',
                  label: 'State, Routing & DI',
                ),
                _AboutFact(
                  icon: Icons.architecture_rounded,
                  textValue: 'Clean',
                  label: 'Scalable Architecture',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutFact extends StatefulWidget {
  const _AboutFact({
    required this.label,
    required this.icon,
    this.value,
    this.suffix = '',
    this.textValue,
  });

  final IconData icon;
  final int? value;
  final String suffix;
  final String? textValue;
  final String label;

  @override
  State<_AboutFact> createState() => _AboutFactState();
}

class _AboutFactState extends State<_AboutFact> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform:
        hovered
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        child: GlassCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  widget.icon,
                  color: theme.colorScheme.primary,
                  size: 26,
                ),
              ),

              const SizedBox(height: 20),

              _AnimatedFactValue(
                value: widget.value,
                suffix: widget.suffix,
                textValue: widget.textValue,
              ),

              const SizedBox(height: 10),

              Text(
                widget.label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedFactValue extends StatelessWidget {
  const _AnimatedFactValue({
    this.value,
    this.suffix = '',
    this.textValue,
  });

  final int? value;
  final String suffix;
  final String? textValue;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displayMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 34,
      fontWeight: FontWeight.bold,
      height: 1,
    );

    if (value == null) {
      return Text(textValue ?? '', style: style);
    }

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value!.toDouble()),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
      builder: (context, animated, _) {
        return Text('${animated.round()}$suffix', style: style);
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:portfolio/controllers/home_controller.dart';
// import 'package:portfolio/core/utils/responsive.dart';
// import 'package:portfolio/data/portfolio_data.dart';
// import 'package:portfolio/widgets/common/glass_card.dart';
// import 'package:portfolio/widgets/common/reveal.dart';
// import 'package:portfolio/widgets/common/section_shell.dart';
//
// class AboutSection extends GetView<HomeController> {
//   const AboutSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final mobile = Responsive.isMobile(context);
//     return SectionShell(
//       sectionKey: controller.aboutKey,
//       eyebrow: 'About me',
//       title:
//           'A Flutter developer focused on production quality and clean delivery.',
//       subtitle: PortfolioData.professionalBio,
//       child: Reveal(
//         child: GridView.count(
//           crossAxisCount: mobile ? 1 : 4,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: mobile ? 2.8 : 2.2,
//           children: const [
//             _AboutFact(
//               value: 3,
//               suffix: '+',
//               label: 'Years building Flutter apps',
//             ),
//             _AboutFact(value: 2, label: 'Store ecosystems shipped'),
//             _AboutFact(textValue: 'GetX', label: 'State, routing, and DI'),
//             _AboutFact(textValue: 'Clean', label: 'Maintainable architecture'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _AboutFact extends StatelessWidget {
//   const _AboutFact({
//     required this.label,
//     this.value,
//     this.suffix = '',
//     this.textValue,
//   });
//
//   final int? value;
//   final String suffix;
//   final String? textValue;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _AnimatedFactValue(value: value, suffix: suffix, textValue: textValue),
//           const SizedBox(height: 8),
//           Text(label, style: Theme.of(context).textTheme.bodyMedium),
//         ],
//       ),
//     );
//   }
// }
//
// class _AnimatedFactValue extends StatelessWidget {
//   const _AnimatedFactValue({this.value, this.suffix = '', this.textValue});
//
//   final int? value;
//   final String suffix;
//   final String? textValue;
//
//   @override
//   Widget build(BuildContext context) {
//     final style = Theme.of(context).textTheme.displayMedium?.copyWith(
//       color: Theme.of(context).colorScheme.primary,
//       fontSize: 34,
//     );
//     if (value == null) return Text(textValue ?? '', style: style);
//
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0, end: value!.toDouble()),
//       duration: const Duration(milliseconds: 900),
//       curve: Curves.easeOutCubic,
//       builder: (context, animated, _) {
//         return Text('${animated.round()}$suffix', style: style);
//       },
//     );
//   }
// }
