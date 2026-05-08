import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class HomeController extends GetxController {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  // 🔗 OPEN LINKS
  // import 'package:flutter/foundation.dart';
  // import 'package:url_launcher/url_launcher.dart';

// 👇 ONLY for web fallback

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // ✅ opens in browser
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: Stack(
        children: [

          // 🔥 LEFT SIDEBAR
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                iconBtn(Icons.email, () {}),
                iconBtnFa(FontAwesomeIcons.github, () => openLink("https://linkedin.com")),
                iconBtnFa(FontAwesomeIcons.linkedin, () => openLink("https://linkedin.com")),
                iconBtnFa(FontAwesomeIcons.whatsapp, () => openLink("https://wa.me/919876543210")),
              ],
            ),
          ),

          // 🔥 MAIN SCROLL
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [

                // ================= HERO =================
                Container(
                  key: controller.homeKey,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),

                      // NAVBAR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          navItem("Home", controller.homeKey),
                          navItem("About", controller.aboutKey),
                          navItem("Skills", controller.skillsKey),
                          navItem("Projects", controller.projectKey),
                          navItem("Contact", controller.contactKey),
                        ],
                      ),

                    // Hello, I’m a Flutter Developer with over 2 years of experience building modern, responsive, and high-performance mobile and web applications. I focus on creating clean, scalable solutions with intuitive user experiences. I’m passionate about turning ideas into functional products and continuously enhancing my skills to deliver efficient and reliable applications.
                      const Spacer(),

                      const Text("Hello, my name is",
                          style: TextStyle(color: Colors.white70)),

                      const SizedBox(height: 10),

                      const Text(
                        "Krishna Kushwah",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      const Text("Flutter Developer",
                          style: TextStyle(color: Colors.white, fontSize: 20)),

                      const SizedBox(height: 20),

                      const Text(
                        "I build scalable mobile & web apps using Flutter, GetX and Firebase.",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 30),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text("DOWNLOAD CV"),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),

                // ================= ABOUT =================
                sectionWrapper(
                  controller.aboutKey,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("About",
                          style:
                          TextStyle(color: Colors.white, fontSize: 32)),
                      SizedBox(height: 20),
                      Text(
                        "I am a Flutter developer with experience in building high-performance applications using GetX and Firebase.\n\nI focus on clean architecture and modern UI design.",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                // ================= SKILLS =================
                sectionWrapper(
                  controller.skillsKey,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Skills",
                          style:
                          TextStyle(color: Colors.white, fontSize: 32)),
                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          skill("Flutter"),
                          skill("Dart"),
                          skill("GetX"),
                          skill("Firebase"),
                          skill("REST API"),
                          skill("UI/UX"),
                        ],
                      )
                    ],
                  ),
                ),

                // ================= PROJECTS =================
                sectionWrapper(
                  controller.projectKey,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Projects",
                          style:
                          TextStyle(color: Colors.white, fontSize: 32)),
                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          projectCard(
                              "Expense Tracker",
                              "Track expenses with charts"),
                          projectCard(
                              "Portfolio Website",
                              "Built with Flutter Web"),
                          projectCard("Chat App",
                              "Realtime Firebase chat app"),
                        ],
                      )
                    ],
                  ),
                ),

                // ================= CONTACT =================
                sectionWrapper(
                  controller.contactKey,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Contact",
                          style:
                          TextStyle(color: Colors.white, fontSize: 32)),
                      SizedBox(height: 20),
                      Text("Email: krishna@example.com",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 10),
                      Text("Phone: +91 9876543210",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 NAV ITEM
  Widget navItem(String title, GlobalKey key) {
    return InkWell(
      onTap: () => controller.scrollTo(key),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // 🔹 SECTION WRAPPER
  Widget sectionWrapper(GlobalKey key, Widget child) {
    return Container(
      key: key,
      width: double.infinity,
      padding: const EdgeInsets.all(80),
      child: child,
    );
  }

  // 🔹 SKILL CHIP
  Widget skill(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(name, style: const TextStyle(color: Colors.white)),
    );
  }

  // 🔹 PROJECT CARD
  Widget projectCard(String title, String desc) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  // 🔹 ICON BUTTONS
  Widget iconBtn(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget iconBtnFa( icon, VoidCallback onTap) {
    log('Press the log button $onTap');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: FaIcon(icon, color: Colors.white),
      ),
    );
  }
}