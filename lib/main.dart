import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Developer Portfolio',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5EFE6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          primary: const Color(0xFF0F766E),
          secondary: const Color(0xFFD97706),
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 52,
            height: 1.05,
            fontWeight: FontWeight.w800,
            color: Color(0xFF102A43),
            letterSpacing: -1.6,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF102A43),
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF102A43),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Color(0xFF334E68),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF486581),
          ),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioController extends GetxController {
  final selectedProject = 0.obs;

  final skills = const <String>[
    'Flutter Web',
    'GetX Architecture',
    'Responsive UI',
    'REST API Integration',
    'Firebase',
    'Animations',
  ];

  final stats = const <Map<String, String>>[
    {'value': '3+', 'label': 'Years building Flutter products'},
    {'value': '12', 'label': 'Production apps delivered'},
    {'value': '8', 'label': 'Reusable GetX modules shipped'},
  ];

  final projects = const <PortfolioProject>[
    PortfolioProject(
      title: 'Sales Command Center',
      tag: 'Flutter Web',
      summary:
          'A responsive admin dashboard with live KPIs, clean chart panels, and role-based flows for internal teams.',
      highlights: [
        'Built adaptive layouts for desktop, tablet, and wide mobile browsers.',
        'Structured feature state with GetX controllers and bindings.',
        'Reduced screen load friction with lazy-loaded modules.',
      ],
    ),
    PortfolioProject(
      title: 'Field Service Tracker',
      tag: 'GetX',
      summary:
          'A mobile-first workflow app for engineers to manage tasks, job notes, and offline-ready service logs.',
      highlights: [
        'Used GetX for navigation, dependency injection, and shared state.',
        'Integrated API sync flows with clear error handling.',
        'Designed compact UI patterns for fast field updates.',
      ],
    ),
    PortfolioProject(
      title: 'Learning App Revamp',
      tag: 'UI Engineering',
      summary:
          'A redesign focused on faster onboarding, clearer lesson progress, and polished interactions across devices.',
      highlights: [
        'Reworked the visual system with stronger hierarchy and spacing.',
        'Improved perceived performance through staged content loading.',
        'Created reusable widgets to speed up future feature delivery.',
      ],
    ),
  ];

  void selectProject(int index) {
    selectedProject.value = index;
  }
}

class PortfolioProject {
  final String title;
  final String tag;
  final String summary;
  final List<String> highlights;

  const PortfolioProject({
    required this.title,
    required this.tag,
    required this.summary,
    required this.highlights,
  });
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortfolioController());
    final theme = Theme.of(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5EFE6), Color(0xFFE6FFFA), Color(0xFFFFF7ED)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1160),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isCompact = constraints.maxWidth < 860;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TopBar(isCompact: isCompact),
                        const SizedBox(height: 28),
                        if (isCompact)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _HeroSection(
                                controller: controller,
                                isCompact: true,
                              ),
                              const SizedBox(height: 24),
                              const _ProfileCard(),
                            ],
                          )
                        else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: _HeroSection(
                                  controller: controller,
                                  isCompact: false,
                                ),
                              ),
                              const SizedBox(width: 24),
                              const Expanded(flex: 2, child: _ProfileCard()),
                            ],
                          ),
                        const SizedBox(height: 28),
                        _SectionCard(
                          title: 'About',
                          child: Text(
                            'Flutter developer with 3 years of experience building responsive apps for mobile and web. I focus on GetX-based architecture, practical UI systems, and product flows that stay maintainable as teams grow.',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SectionCard(
                          title: 'Core Skills',
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: controller.skills
                                .map(
                                  (skill) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF0F766E,
                                      ).withValues(alpha: 0.08),
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: const Color(
                                          0xFF0F766E,
                                        ).withValues(alpha: 0.16),
                                      ),
                                    ),
                                    child: Text(
                                      skill,
                                      style: const TextStyle(
                                        color: Color(0xFF0B5D56),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SectionCard(
                          title: 'Featured Projects',
                          child: Obx(() {
                            final active = controller
                                .projects[controller.selectedProject.value];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(
                                    controller.projects.length,
                                    (index) {
                                      final project =
                                          controller.projects[index];
                                      final selected =
                                          controller.selectedProject.value ==
                                          index;

                                      return ChoiceChip(
                                        label: Text(project.title),
                                        selected: selected,
                                        onSelected: (_) =>
                                            controller.selectProject(index),
                                        selectedColor: const Color(0xFF102A43),
                                        labelStyle: TextStyle(
                                          color: selected
                                              ? Colors.white
                                              : const Color(0xFF102A43),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        backgroundColor: const Color(
                                          0xFFF8FAFC,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF102A43),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(
                                            0xFFFFF7ED,
                                          ).withValues(alpha: 0.14),
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        child: Text(
                                          active.tag,
                                          style: const TextStyle(
                                            color: Color(0xFFFFEDD5),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        active.title,
                                        style: theme.textTheme.headlineMedium
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        active.summary,
                                        style: theme.textTheme.bodyLarge
                                            ?.copyWith(
                                              color: const Color(0xFFD9E2EC),
                                            ),
                                      ),
                                      const SizedBox(height: 18),
                                      ...active.highlights.map(
                                        (item) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  top: 6,
                                                ),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 10,
                                                  color: Color(0xFFF59E0B),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  item,
                                                  style: theme
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        color: const Color(
                                                          0xFFD9E2EC,
                                                        ),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        _SectionCard(
                          title: 'Contact',
                          child: Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            children: const [
                              _ContactTile(
                                icon: Icons.email_outlined,
                                title: 'Email',
                                value: 'flutter.dev@example.com',
                              ),
                              _ContactTile(
                                icon: Icons.language_outlined,
                                title: 'Website',
                                value: 'yourportfolio.dev',
                              ),
                              _ContactTile(
                                icon: Icons.code_outlined,
                                title: 'GitHub',
                                value: 'github.com/yourprofile',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool isCompact;

  const _TopBar({required this.isCompact});

  @override
  Widget build(BuildContext context) {
    final links = ['About', 'Skills', 'Projects', 'Contact'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.65)),
      ),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KRISHNA.dev',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF102A43),
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: links
                      .map(
                        (item) => Text(
                          item,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF486581),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            )
          : Row(
              children: [
                const Text(
                  'KRISHNA.dev',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF102A43),
                    letterSpacing: 0.4,
                  ),
                ),
                const Spacer(),
                ...links.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF486581),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final PortfolioController controller;
  final bool isCompact;

  const _HeroSection({required this.controller, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFD97706).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Flutter Developer • 3 Years Experience',
            style: TextStyle(
              color: Color(0xFF9A5B00),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Building Flutter and GetX products that feel clean, fast, and production-ready.',
          style: isCompact
              ? theme.textTheme.headlineMedium?.copyWith(fontSize: 38)
              : theme.textTheme.displayLarge,
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            'I design and ship responsive Flutter applications with a strong focus on scalable GetX structure, user-friendly flows, and polished interface details for web and mobile.',
            style: theme.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF102A43),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('View Projects'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF0F766E), width: 1.4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Contact Me',
                style: TextStyle(
                  color: Color(0xFF0F766E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: controller.stats
              .map(
                (item) => Container(
                  width: isCompact ? double.infinity : 200,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 24,
                        offset: Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['value']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF102A43),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item['label']!, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF102A43),
        borderRadius: BorderRadius.circular(36),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 30,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFF59E0B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            height: 94,
            width: 94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFFD97706)],
              ),
            ),
            child: const Icon(
              Icons.flutter_dash,
              color: Colors.white,
              size: 46,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Krishna',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter Developer specializing in GetX architecture, reusable UI systems, and responsive product experiences.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFFD9E2EC),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF243B53)),
          const SizedBox(height: 18),
          const _ProfileRow(label: 'Experience', value: '3 years'),
          const SizedBox(height: 12),
          const _ProfileRow(label: 'Primary Stack', value: 'Flutter + GetX'),
          const SizedBox(height: 12),
          const _ProfileRow(label: 'Focus', value: 'Web, Mobile, UI'),
        ],
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF9FB3C8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0F766E).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF0F766E)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF486581),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF102A43),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
