import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  final isDarkMode = true.obs;
  final activeProjectFilter = 'All'.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final projectFilters = const ['All', 'Attendance', 'HRM', 'Education'];

  List<PortfolioProject> get filteredProjects {
    if (activeProjectFilter.value == 'All') return PortfolioData.projects;
    return PortfolioData.projects
        .where((project) => project.category == activeProjectFilter.value)
        .toList();
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
    );
  }

  void updateProjectFilter(String filter) => activeProjectFilter.value = filter;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> openUrl(String value) async {
    final parsed = Uri.parse(value);
    final uri = parsed.hasScheme ? parsed : Uri.base.resolve(value);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Get.snackbar('Unable to open link', value);
    }
  }

  Future<void> sendContactEmail() async {
    final subject = Uri.encodeComponent('Flutter Developer Opportunity');
    final body = Uri.encodeComponent(
      'Hi, my name is ${nameController.text}.\n\n${messageController.text}\n\nReply to: ${emailController.text}',
    );
    await openUrl('mailto:${PortfolioData.email}?subject=$subject&body=$body');
  }

  @override
  void onClose() {
    scrollController.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
