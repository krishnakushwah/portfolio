import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/responsive.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.sectionKey,
    required this.eyebrow,
    required this.title,
    required this.child,
    this.subtitle,
  });

  final GlobalKey sectionKey;
  final String eyebrow;
  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? 56 : 84,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          padding: Responsive.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 14),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
              const SizedBox(height: 32),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
