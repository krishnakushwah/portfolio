// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/home_controller.dart';
//
// class Navbar extends StatelessWidget {
//   final controller = Get.find<HomeController>();
//
//   Widget navItem(String title, GlobalKey key) {
//     return InkWell(
//       onTap: () => controller.scrollToSection(key),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         navItem("Home", controller.homeKey),
//         navItem("About", controller.aboutKey),
//         navItem("Skills", controller.skillsKey),
//         navItem("Projects", controller.projectsKey),
//         navItem("Contact", controller.contactKey),
//       ],
//     );
//   }
// }