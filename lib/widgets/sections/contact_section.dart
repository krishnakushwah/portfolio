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
import 'package:portfolio/widgets/common/section_shell.dart';

class ContactSection extends GetView<HomeController> {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    return SectionShell(
      sectionKey: controller.contactKey,
      eyebrow: 'Contact',
      title: 'Available for Flutter roles, remote jobs, and freelance product builds.',
      subtitle: 'Send a message or connect directly through email, WhatsApp, LinkedIn, or GitHub.',
      child: mobile
          ? const Column(
              children: [_ContactForm(), SizedBox(height: 18), _ContactLinks()],
            )
          : const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _ContactForm()),
                SizedBox(width: 18),
                Expanded(flex: 4, child: _ContactLinks()),
              ],
            ),
    );
  }
}

class _ContactForm extends GetView<HomeController> {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Reveal(
      child: GlassCard(
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller.messageController,
              minLines: 5,
              maxLines: 7,
              decoration: const InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.chat_rounded),
              ),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerLeft,
              child: AppButton(
                label: 'Send Message',
                icon: Icons.send_rounded,
                onPressed: controller.sendContactEmail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactLinks extends StatelessWidget {
  const _ContactLinks();

  @override
  Widget build(BuildContext context) {
    return const Reveal(
      delay: Duration(milliseconds: 120),
      child: Column(
        children: [
          _ContactTile(
            icon: Icons.email_rounded,
            label: 'Email',
            value: PortfolioData.email,
            url: 'mailto:${PortfolioData.email}',
          ),
          _ContactTile(
            icon: FontAwesomeIcons.whatsapp,
            label: 'WhatsApp',
            value: PortfolioData.whatsapp,
            url: PortfolioData.whatsappUrl,
          ),
          _ContactTile(
            icon: FontAwesomeIcons.linkedinIn,
            label: 'LinkedIn',
            value: PortfolioData.linkedIn,
            url: PortfolioData.linkedIn,
          ),
          _ContactTile(
            icon: FontAwesomeIcons.github,
            label: 'GitHub',
            value: PortfolioData.github,
            url: PortfolioData.github,
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends GetView<HomeController> {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  final Object icon;
  final String label;
  final String value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: const EdgeInsets.all(18),
        child: InkWell(
          onTap: () => controller.openUrl(url),
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              AdaptiveIcon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.open_in_new_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
