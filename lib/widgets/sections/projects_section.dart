import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/widgets/common/glass_card.dart';
import 'package:portfolio/widgets/common/reveal.dart';
import 'package:portfolio/widgets/common/section_shell.dart';

class ProjectsSection extends GetView<HomeController> {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final device = Responsive.device(context);
    final crossAxisCount = switch (device) {
      DeviceSize.mobile => 1,
      DeviceSize.tablet => 2,
      DeviceSize.desktop => 3,
    };
    final cardHeight = switch (device) {
      DeviceSize.mobile => 720.0,
      DeviceSize.tablet => 700.0,
      DeviceSize.desktop => 720.0,
    };
    return SectionShell(
      sectionKey: controller.projectsKey,
      eyebrow: 'Projects',
      title:
          'Production apps with business workflows and real release constraints.',
      subtitle:
          'Interactive showcase for recruiter review: overview, features, technologies, architecture, and contribution for each professional project.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final filter in controller.projectFilters)
                  ChoiceChip(
                    label: Text(filter),
                    selected: controller.activeProjectFilter.value == filter,
                    onSelected: (_) => controller.updateProjectFilter(filter),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.filteredProjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: cardHeight,
              ),
              itemBuilder: (context, index) {
                final project = controller.filteredProjects[index];
                return Reveal(
                  delay: Duration(milliseconds: index * 80),
                  child: _ProjectCard(project: project),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectMockup(project: project),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Chip(label: Text(project.category)),
            ],
          ),
          const SizedBox(height: 10),
          Text(project.overview, maxLines: 3, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 14),
          Text('Key features', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final feature in project.features.take(3))
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          const Spacer(),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final tech in project.technologies) Chip(label: Text(tech)),
            ],
          ),
          const SizedBox(height: 14),
          _DetailBlock(
            title: 'Architecture',
            body: project.architecture,
          ),
          const SizedBox(height: 10),
          _DetailBlock(
            title: 'Role',
            body: project.contribution,
          ),
        ],
      ),
    );
  }
}

class _DetailBlock extends StatelessWidget {
  const _DetailBlock({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _ProjectMockup extends StatelessWidget {
  const _ProjectMockup({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 1.65,
      child: Container(
        decoration: BoxDecoration(
          color: scheme.primary.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: scheme.primary.withValues(alpha: .18)),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 64,
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: scheme.onSurface.withValues(alpha: .08),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 22,
                    height: 4,
                    decoration: BoxDecoration(
                      color: scheme.onSurface.withValues(alpha: .2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.flutter_dash_rounded, color: scheme.primary),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _Bar(width: .9),
                  const SizedBox(height: 8),
                  _Bar(width: .62),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(child: _SmallPanel()),
                      SizedBox(width: 8),
                      Expanded(child: _SmallPanel()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width,
      child: Container(
        height: 9,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .14),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class _SmallPanel extends StatelessWidget {
  const _SmallPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: .76),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
