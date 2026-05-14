import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final device = Responsive.device(context);

    final crossAxisCount = switch (device) {
      DeviceSize.mobile => 1,
      DeviceSize.tablet => 2,
      DeviceSize.desktop => 4,
    };

    return Container(
      width: double.infinity,
      padding:
      Responsive.pagePadding(context).copyWith(top: 1, bottom: 1),
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.achievements.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio:
            device == DeviceSize.mobile ? 3.5 : 1.5,
          ),
          itemBuilder: (context, index) {
            final achievement = PortfolioData.achievements[index];

            return Reveal(
              delay: Duration(milliseconds: index * 70),
              child: GlassCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getAchievementIcon(achievement),
                        color: Theme.of(context).colorScheme.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      achievement,
                      style:
                      Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getAchievementIcon(String achievement) {
    if (achievement.contains('Google Play')) {
      return Icons.play_circle_fill_rounded;
    } else if (achievement.contains('Apple App Store')) {
      return Icons.apple_rounded;
    } else if (achievement.contains('cross-platform')) {
      return Icons.devices_rounded;
    } else if (achievement.contains('UI responsiveness')) {
      return Icons.auto_fix_high_rounded;
    }

    return Icons.workspace_premium_rounded;
  }
}