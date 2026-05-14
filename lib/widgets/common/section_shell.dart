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
      constraints: BoxConstraints(
        minHeight: Responsive.isMobile(context) ? 0 : MediaQuery.sizeOf(context).height * 0.7,
      ),
      padding: EdgeInsets.symmetric(
        // vertical: Responsive.isMobile(context) ? 60 : 100,
        vertical: Responsive.isMobile(context) ? 60 : 50,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          padding: Responsive.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                eyebrow.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 32 : 35,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 15),
                Text(subtitle!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),),
                ),
              ],
              const SizedBox(height: 48),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
