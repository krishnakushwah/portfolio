import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/project.dart';

class PortfolioData {
  static const name = 'Krishna Kushwah';
  static const role = 'Flutter Developer';
  static const experience = '3 Years';
  static const email = 'krishna.kushwah199928@gmail.com';
  static const whatsapp = '+91 9074094167';
  static const whatsappUrl = 'https://wa.me/919074094167';
  static const github = 'https://github.com/krishnakushwah';
  static const linkedIn =
      'https://www.linkedin.com/in/krishna-kushwah-94950018b';

  // https://www.linkedin.com/in/krishna-kushwah-94950018b/
  static const resumePath = 'resume.pdf';

  static const professionalBio =
      'Flutter Developer with 3 years of professional experience building production-ready Android, iOS, and web applications. Specialized in GetX, REST API integration, Firebase, app publishing, performance optimization, and clean architecture. I focus on reliable product engineering, responsive UI, maintainable codebases, and scalable app delivery.';

  static const resumeSummary =
      'Flutter Developer with 3 years of experience delivering production mobile applications for attendance, HRM, and school management domains. Skilled in Flutter, Dart, GetX, REST APIs, Firebase, Play Store and App Store publishing, performance tuning, and clean architecture.';

  static const seoDescription =
      'Portfolio of Your Name, a Flutter Developer with 3 years of experience in Flutter, GetX, Firebase, REST APIs, Play Store publishing, App Store publishing, clean architecture, and responsive UI development.';

  static const taglines = <String>[
    'I build fast, scalable Flutter apps for Android, iOS, and web.',
    'Production Flutter engineering with clean architecture and polished UI.',
    'Helping teams ship reliable cross-platform apps with Flutter and GetX.',
  ];

  static const skills = <({Object icon, String name, String note})>[
    (
      icon: Icons.flutter_dash_rounded,
      name: 'Flutter',
      note: 'Cross-platform app development',
    ),
    (
      icon: Icons.code_rounded,
      name: 'Dart',
      note: 'Clean & scalable architecture',
    ),
    (
      icon: Icons.hub_rounded,
      name: 'GetX',
      note: 'State management & navigation',
    ),
    (
      icon: Icons.local_fire_department_rounded,
      name: 'Firebase',
      note: 'Firestore & Notifications',
    ),
    (icon: Icons.security_rounded, name: 'Firebase Auth', note: 'Secure authentication'),
    (icon: Icons.api_rounded, name: 'REST APIs', note: 'Backend integrations'),
    (icon: Icons.storage_rounded, name: 'Hive', note: 'Offline local storage'),
    (icon: Icons.code_off_rounded, name: 'Clean Architecture', note: 'Maintainable codebase'),
   (icon: Icons.speed_rounded, name: 'App Optimization', note: 'Fast & scalable apps'),
    (
      icon: Icons.devices_rounded,
      name: 'Responsive UI',
      note: 'Mobile, tablet & web layouts',
    ),
    (icon: Icons.commit_rounded, name: 'Git & GitHub', note: 'Version control & collaboration'),

    (
      icon: Icons.rocket_launch_rounded,
      name: 'App Deployment',
      note: 'Play Store & App Store release',
    ),
  ];

  // static const skills = <({Object icon, String name, String note})>[
  //   (icon: Icons.flutter_dash_rounded, name: 'Flutter', note: 'Production apps'),
  //   (icon: Icons.code_rounded, name: 'Dart', note: 'Clean, typed code'),
  //   (icon: Icons.hub_rounded, name: 'GetX', note: 'State and routing'),
  //   (icon: Icons.local_fire_department_rounded, name: 'Firebase', note: 'Auth, DB, push'),
  //   (icon: Icons.api_rounded, name: 'REST APIs', note: 'Secure integrations'),
  //   (icon: FontAwesomeIcons.gitAlt, name: 'Git', note: 'Team workflows'),
  //   (icon: Icons.rocket_launch_rounded, name: 'CI/CD', note: 'Release pipelines'),
  //   (icon: Icons.storefront_rounded, name: 'App Publishing', note: 'Play Store, App Store'),
  //   (icon: Icons.devices_rounded, name: 'Responsive UI', note: 'Mobile to web'),
  //
  //   // Added Skills
  //   (icon: Icons.storage_rounded, name: 'SQLite', note: 'Local database'),
  //   (icon: Icons.cloud_done_rounded, name: 'Firestore', note: 'Realtime cloud DB'),
  //   (icon: Icons.security_rounded, name: 'Firebase Auth', note: 'Secure authentication'),
  //   (icon: Icons.notifications_active_rounded, name: 'Push Notifications', note: 'FCM integration'),
  //   (icon: Icons.payment_rounded, name: 'Payment Gateway', note: 'Razorpay, Stripe'),
  //   (icon: Icons.map_rounded, name: 'Google Maps', note: 'Location services'),
  //   (icon: Icons.offline_bolt_rounded, name: 'Offline Storage', note: 'Hive & GetStorage'),
  //   (icon: Icons.bug_report_rounded, name: 'Debugging', note: 'Performance optimization'),
  //   (icon: Icons.animation_rounded, name: 'Animations', note: 'Smooth UI interactions'),
  //   (icon: Icons.design_services_rounded, name: 'UI/UX Design', note: 'Modern app interfaces'),
  //   (icon: Icons.web_rounded, name: 'Flutter Web', note: 'Responsive web apps'),
  //   (icon: Icons.phone_android_rounded, name: 'Android Development', note: 'Native integrations'),
  //   (icon: Icons.apple_rounded, name: 'iOS Deployment', note: 'App Store releases'),
  //   (icon: Icons.sync_rounded, name: 'State Management', note: 'GetX, Provider'),
  //   (icon: Icons.integration_instructions_rounded, name: 'API Integration', note: 'JSON & backend services'),
  //   (icon: Icons.speed_rounded, name: 'App Optimization', note: 'Fast & scalable apps'),
  //   (icon: Icons.code_off_rounded, name: 'Clean Architecture', note: 'Maintainable codebase'),
  //   (icon: Icons.auto_graph_rounded, name: 'Analytics', note: 'Firebase Analytics'),
  //   (icon: Icons.build_circle_rounded, name: 'Package Development', note: 'Reusable components'),
  //   (icon: Icons.smartphone_rounded, name: 'Cross Platform', note: 'Android, iOS, Web'),
  // ];

  static const projects = <PortfolioProject>[
    PortfolioProject(
      name: 'UBIATT',
      category: 'Attendance',
      overview:
          'A production attendance application designed for reliable daily workforce tracking, location-aware workflows, and smooth employee usage across devices.',
      features: [
        'Attendance check-in and check-out flows',
        'Employee activity visibility',
        'REST API driven data sync',
        'Responsive dashboards and role-based screens',
      ],
      technologies: ['Flutter', 'Dart', 'GetX', 'REST APIs', 'Firebase'],
      architecture:
          'Feature-first clean architecture with GetX controllers, repository abstractions, API services, and reusable UI components.',
      contribution:
          'Built core Flutter modules, integrated backend APIs, optimized screen performance, handled release builds, and supported production publishing.',
    ),
    PortfolioProject(
      name: 'UBI HRM',
      category: 'HRM',
      overview:
          'A human resource management app focused on employee operations, approvals, profile management, and mobile-first HR workflows.',
      features: [
        'Employee profile and HR workflows',
        'Leave and approval experiences',
        'Reusable form components',
        'Production release support',
      ],
      technologies: ['Flutter', 'Dart', 'GetX', 'REST APIs', 'App Publishing'],
      architecture:
          'Layered Flutter architecture using separated presentation, controller, domain-friendly data models, and service layers.',
      contribution:
          'Delivered responsive screens, connected authenticated APIs, refined UX states, fixed release issues, and supported store deployment.',
    ),
    PortfolioProject(
      name: 'UBI School',
      category: 'Education',
      overview:
          'A school management application built for students, parents, and staff with structured information access and stable cross-platform delivery.',
      features: [
        'School communication modules',
        'Student and staff information views',
        'Mobile optimized navigation',
        'Firebase-enabled app capabilities',
      ],
      technologies: ['Flutter', 'Dart', 'GetX', 'Firebase', 'Responsive UI'],
      architecture:
          'Scalable module-based architecture with shared widgets, state controllers, API layers, and theme-aware UI components.',
      contribution:
          'Implemented app screens, state handling, Firebase integrations, UI polish, testing fixes, and publishing support.',
    ),
  ];

  static const achievements = <String>[
    'Published production apps on Google Play Store',
    'Published production apps on Apple App Store',
    'Delivered cross-platform Flutter applications for real users',
    'Improved app reliability, UI responsiveness, and maintainability',
  ];
}
