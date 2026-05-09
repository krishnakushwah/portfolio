import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
        padding: Responsive.pagePadding(context).copyWith(top: 28, bottom: 56),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.achievements.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mobile ? 1 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: mobile ? 3.2 : 1.25,
          ),
          itemBuilder: (context, index) => Reveal(
            delay: Duration(milliseconds: index * 70),
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.workspace_premium_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    PortfolioData.achievements[index],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
