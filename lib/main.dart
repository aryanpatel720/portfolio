// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(const AryanPortfolio());
// }
//
// // ========== THEME CONTROLLER ==========
// class ThemeController extends GetxController {
//   var isDarkMode = false.obs;
//   Rx<Color> primaryColor = Colors.blue.obs;
//
//   void toggleTheme() => isDarkMode.value = !isDarkMode.value;
//
//   void changePrimaryColor(Color color) {
//     primaryColor.value = color;
//   }
// }
//
// // ========== MAIN APP ==========
// class AryanPortfolio extends StatelessWidget {
//   const AryanPortfolio({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeController themeController = Get.put(ThemeController());
//
//     return Obx(() => GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Aryan Patel | Flutter Developer',
//           themeMode: themeController.isDarkMode.value
//               ? ThemeMode.dark
//               : ThemeMode.light,
//           theme: ThemeData(
//             useMaterial3: true,
//             brightness: Brightness.light,
//             colorScheme: ColorScheme.fromSeed(
//               seedColor: themeController.primaryColor.value,
//               brightness: Brightness.light,
//             ),
//             scaffoldBackgroundColor: Colors.white,
//             textTheme:
//                 GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.black87),
//           ),
//           darkTheme: ThemeData(
//             useMaterial3: true,
//             brightness: Brightness.dark,
//             colorScheme: ColorScheme.fromSeed(
//               seedColor: themeController.primaryColor.value,
//               brightness: Brightness.dark,
//             ),
//             scaffoldBackgroundColor: const Color(0xFF0A0A0A),
//             textTheme:
//                 GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
//           ),
//           home: const HomePage(),
//         ));
//   }
// }
//
// // ========== HOME PAGE ==========
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final themeController = Get.find<ThemeController>();
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 600;
//     final isTablet = width >= 600 && width < 900;
//
//     return Obx(() {
//       final isDark = themeController.isDarkMode.value;
//       final primaryColor = themeController.primaryColor.value;
//
//       return Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             // ========== APP BAR ==========
//             SliverAppBar(
//               floating: true,
//               snap: true,
//               elevation: 0,
//               backgroundColor: isDark ? const Color(0xFF0A0A0A) : Colors.white,
//               title: Text(
//                 'AP',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   color: primaryColor,
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
//                   onPressed: themeController.toggleTheme,
//                   tooltip: 'Toggle Theme',
//                 ),
//                 PopupMenuButton<Color>(
//                   icon: const Icon(Icons.palette),
//                   tooltip: 'Change Color',
//                   onSelected: themeController.changePrimaryColor,
//                   itemBuilder: (context) => [
//                     _colorMenuItem(Colors.blue, 'Blue'),
//                     _colorMenuItem(Colors.purple, 'Purple'),
//                     _colorMenuItem(Colors.teal, 'Teal'),
//                     _colorMenuItem(Colors.orange, 'Orange'),
//                     _colorMenuItem(Colors.pink, 'Pink'),
//                     _colorMenuItem(Colors.green, 'Green'),
//                   ],
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//
//             // ========== CONTENT ==========
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   // ===== HERO SECTION =====
//                   _buildHeroSection(isDark, primaryColor, isMobile, width),
//
//                   // ===== ABOUT SECTION =====
//                   _buildAboutSection(isDark, primaryColor, isMobile),
//
//                   // ===== SKILLS SECTION =====
//                   _buildSkillsSection(isDark, primaryColor, isMobile),
//
//                   // ===== EXPERIENCE SECTION =====
//                   _buildExperienceSection(isDark, primaryColor, isMobile),
//
//                   // ===== PROJECTS SECTION =====
//                   _buildProjectsSection(isDark, primaryColor, isMobile, width),
//
//                   // ===== CONTACT SECTION =====
//                   _buildContactSection(isDark, primaryColor, isMobile),
//
//                   // ===== FOOTER =====
//                   _buildFooter(isDark, primaryColor),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   PopupMenuItem<Color> _colorMenuItem(Color color, String label) {
//     return PopupMenuItem<Color>(
//       value: color,
//       child: Row(
//         children: [
//           Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(label),
//         ],
//       ),
//     );
//   }
//
//   // ========== HERO SECTION ==========
//   Widget _buildHeroSection(
//       bool isDark, Color primaryColor, bool isMobile, double width) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         vertical: isMobile ? 80 : 140,
//         horizontal: isMobile ? 20 : 40,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Profile Image
//           Container(
//             width: isMobile ? 120 : 150,
//             height: isMobile ? 120 : 150,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 colors: [primaryColor, primaryColor.withOpacity(0.6)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: primaryColor.withOpacity(0.3),
//                   blurRadius: 30,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 'AP',
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 48 : 60,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           )
//               .animate()
//               .scale(duration: 600.ms, curve: Curves.easeOutBack)
//               .fadeIn(),
//
//           const SizedBox(height: 30),
//
//           // Name
//           Text(
//             "Aryan Patel",
//             style: GoogleFonts.poppins(
//               fontSize: isMobile ? 32 : 48,
//               fontWeight: FontWeight.bold,
//               color: isDark ? Colors.white : Colors.black,
//             ),
//           ).animate().fade(duration: 800.ms).slideY(begin: 0.3),
//
//           const SizedBox(height: 12),
//
//           // Animated Role
//           ShaderMask(
//             shaderCallback: (bounds) => LinearGradient(
//               colors: [primaryColor, primaryColor.withOpacity(0.7)],
//             ).createShader(bounds),
//             child: Text(
//               "Flutter Developer",
//               style: GoogleFonts.poppins(
//                 fontSize: isMobile ? 20 : 28,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ).animate().fade(duration: 1000.ms).slideY(begin: 0.3),
//
//           const SizedBox(height: 20),
//
//           // Description
//           Text(
//             "Building Beautiful Cross-Platform Apps",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               fontSize: isMobile ? 16 : 20,
//               color: isDark ? Colors.white70 : Colors.black54,
//             ),
//           ).animate().fade(duration: 1200.ms),
//
//           const SizedBox(height: 40),
//
//           // CTA Buttons
//           Wrap(
//             spacing: 16,
//             runSpacing: 16,
//             alignment: WrapAlignment.center,
//             children: [
//               _gradientButton(
//                 "Hire Me",
//                 Icons.work_outline,
//                 primaryColor,
//                 () => _launchMail(),
//               ),
//               _outlineButton(
//                 "Download CV",
//                 Icons.download,
//                 primaryColor,
//                 isDark,
//                 () {},
//               ),
//             ],
//           ).animate().fade(duration: 1400.ms).slideY(begin: 0.3),
//
//           const SizedBox(height: 40),
//
//           // Social Links
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _socialIcon(FontAwesomeIcons.github, primaryColor, () {}),
//               const SizedBox(width: 20),
//               _socialIcon(FontAwesomeIcons.linkedin, primaryColor, () {}),
//               const SizedBox(width: 20),
//               _socialIcon(FontAwesomeIcons.instagram, primaryColor, () {}),
//               const SizedBox(width: 20),
//               _socialIcon(FontAwesomeIcons.envelope, primaryColor, _launchMail),
//             ],
//           ).animate().fade(duration: 1600.ms),
//         ],
//       ),
//     );
//   }
//
//   // ========== ABOUT SECTION ==========
//   Widget _buildAboutSection(bool isDark, Color primaryColor, bool isMobile) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       child: Column(
//         children: [
//           _sectionTitle("About Me", primaryColor, isDark),
//           const SizedBox(height: 30),
//           Container(
//             constraints: const BoxConstraints(maxWidth: 800),
//             padding: EdgeInsets.all(isMobile ? 24 : 32),
//             decoration: BoxDecoration(
//               color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: primaryColor.withOpacity(0.2),
//                 width: 2,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "👋 Hello! I'm a passionate Flutter Developer from India 🇮🇳",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 18 : 22,
//                     fontWeight: FontWeight.w600,
//                     color: isDark ? Colors.white : Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "With 2.5+ years of experience, I specialize in creating stunning cross-platform mobile applications. I've successfully delivered 10+ production apps including dating platforms, e-commerce solutions, event management systems, and cloud-based file managers.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 15 : 17,
//                     height: 1.7,
//                     color: isDark ? Colors.white70 : Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "💡 I transform ideas into reality with clean code, beautiful UI, and smooth animations.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 15 : 17,
//                     fontStyle: FontStyle.italic,
//                     color: primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
//           const SizedBox(height: 40),
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: [
//               _statCard("2.5+", "Years Experience", primaryColor, isDark),
//               _statCard("10+", "Apps Built", primaryColor, isDark),
//               _statCard("100%", "Client Satisfaction", primaryColor, isDark),
//             ],
//           ).animate().fadeIn(duration: 1000.ms),
//         ],
//       ),
//     );
//   }
//
//   // ========== SKILLS SECTION ==========
//   Widget _buildSkillsSection(bool isDark, Color primaryColor, bool isMobile) {
//     final skills = [
//       {'name': 'Flutter & Dart', 'icon': Icons.flutter_dash, 'level': 0.95},
//       {'name': 'Firebase', 'icon': Icons.cloud, 'level': 0.90},
//       {'name': 'GetX', 'icon': Icons.settings, 'level': 0.92},
//       {'name': 'Agora (Video/Audio)', 'icon': Icons.videocam, 'level': 0.88},
//       {'name': 'Payment Gateway', 'icon': Icons.payment, 'level': 0.85},
//       {'name': 'REST APIs', 'icon': Icons.api, 'level': 0.90},
//       {'name': 'UI/UX Design', 'icon': Icons.design_services, 'level': 0.93},
//       {'name': 'Animations', 'icon': Icons.animation, 'level': 0.91},
//       {'name': 'State Management', 'icon': Icons.storage, 'level': 0.90},
//       {'name': 'Responsive Design', 'icon': Icons.devices, 'level': 0.94},
//     ];
//
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       child: Column(
//         children: [
//           _sectionTitle("Technical Skills", primaryColor, isDark),
//           const SizedBox(height: 40),
//           Wrap(
//             spacing: 16,
//             runSpacing: 16,
//             alignment: WrapAlignment.center,
//             children: skills.map((skill) {
//               return _skillCard(
//                 skill['name'] as String,
//                 skill['icon'] as IconData,
//                 skill['level'] as double,
//                 primaryColor,
//                 isDark,
//                 isMobile,
//               );
//             }).toList(),
//           ).animate().fadeIn(duration: 1000.ms),
//         ],
//       ),
//     );
//   }
//
//   // ========== EXPERIENCE SECTION ==========
//   Widget _buildExperienceSection(
//       bool isDark, Color primaryColor, bool isMobile) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       child: Column(
//         children: [
//           _sectionTitle("What I Can Build", primaryColor, isDark),
//           const SizedBox(height: 40),
//           _experienceCard(
//             "📱 Mobile Applications",
//             [
//               "Dating Apps with Real-time Chat & Video Calls",
//               "Food Delivery Apps",
//               "E-commerce Solutions",
//               "Event Management Systems",
//               "Social Media Platforms"
//             ],
//             primaryColor,
//             isDark,
//             isMobile,
//           ),
//           const SizedBox(height: 24),
//           _experienceCard(
//             "🎥 Media & Communication",
//             [
//               "Video & Audio Calling (Agora SDK)",
//               "Live Streaming Applications",
//               "Real-time Chat Systems",
//               "WebRTC Integration"
//             ],
//             primaryColor,
//             isDark,
//             isMobile,
//           ),
//           const SizedBox(height: 24),
//           _experienceCard(
//             "☁️ Backend & Cloud",
//             [
//               "Firebase Integration (Auth, Firestore, Storage)",
//               "Cloud File Management",
//               "Payment Gateway Integration",
//               "RESTful API Integration"
//             ],
//             primaryColor,
//             isDark,
//             isMobile,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ========== PROJECTS SECTION ==========
//   Widget _buildProjectsSection(
//       bool isDark, Color primaryColor, bool isMobile, double width) {
//     final projects = [
//       {
//         'title': 'Dating App',
//         'desc':
//             'Complete dating platform with video/audio calls, live chat, matching algorithm, and real-time notifications.',
//         'tech': ['Flutter', 'Firebase', 'Agora', 'GetX'],
//         'icon': Icons.favorite,
//       },
//       {
//         'title': 'CricRoyal (Like CricHeroes)',
//         'desc':
//             'Cricket scoring app with live match updates, player statistics, tournament management, and social features.',
//         'tech': ['Flutter', 'Firebase', 'REST API'],
//         'icon': Icons.sports_cricket,
//       },
//       {
//         'title': 'Food Delivery App',
//         'desc':
//             'Full-featured food ordering platform with restaurant listings, cart management, and order tracking.',
//         'tech': ['Flutter', 'Firebase', 'Payment Gateway'],
//         'icon': Icons.restaurant,
//       },
//       {
//         'title': 'Event Management System',
//         'desc':
//             'Complete event platform with cloud storage, ticket booking, file manager, and live event updates.',
//         'tech': ['Flutter', 'Firebase Storage', 'GetX'],
//         'icon': Icons.event,
//       },
//       {
//         'title': 'Chat Application',
//         'desc':
//             'Real-time messaging app with group chats, media sharing, voice messages, and online status.',
//         'tech': ['Flutter', 'Firebase', 'Push Notifications'],
//         'icon': Icons.chat,
//       },
//       {
//         'title': 'Live Streaming App',
//         'desc':
//             'Live video streaming platform with real-time comments, viewer count, and monetization features.',
//         'tech': ['Flutter', 'Agora', 'Firebase'],
//         'icon': Icons.live_tv,
//       },
//     ];
//
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       child: Column(
//         children: [
//           _sectionTitle("Featured Projects", primaryColor, isDark),
//           const SizedBox(height: 40),
//           Container(
//             constraints: const BoxConstraints(maxWidth: 1200),
//             child: Wrap(
//               spacing: 24,
//               runSpacing: 24,
//               alignment: WrapAlignment.center,
//               children: projects.map((project) {
//                 return _projectCard(
//                   project['title'] as String,
//                   project['desc'] as String,
//                   project['tech'] as List<String>,
//                   project['icon'] as IconData,
//                   primaryColor,
//                   isDark,
//                   isMobile,
//                 );
//               }).toList(),
//             ),
//           ).animate().fadeIn(duration: 1000.ms),
//         ],
//       ),
//     );
//   }
//
//   // ========== CONTACT SECTION ==========
//   Widget _buildContactSection(bool isDark, Color primaryColor, bool isMobile) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(isMobile ? 20 : 40),
//       child: Column(
//         children: [
//           _sectionTitle("Let's Work Together", primaryColor, isDark),
//           const SizedBox(height: 30),
//           Text(
//             "Have a project in mind? Let's build something amazing!",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               fontSize: isMobile ? 16 : 18,
//               color: isDark ? Colors.white70 : Colors.black54,
//             ),
//           ),
//           const SizedBox(height: 40),
//           Container(
//             constraints: const BoxConstraints(maxWidth: 600),
//             padding: EdgeInsets.all(isMobile ? 24 : 32),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   primaryColor.withOpacity(0.1),
//                   primaryColor.withOpacity(0.05),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: primaryColor.withOpacity(0.3)),
//             ),
//             child: Column(
//               children: [
//                 Icon(
//                   Icons.email_outlined,
//                   size: 48,
//                   color: primaryColor,
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "aryanpatel1832@gmail.com",
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 16 : 18,
//                     fontWeight: FontWeight.w500,
//                     color: isDark ? Colors.white : Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 _gradientButton(
//                   "Send Email",
//                   Icons.send,
//                   primaryColor,
//                   _launchMail,
//                 ),
//               ],
//             ),
//           ).animate().fadeIn(duration: 800.ms).scale(),
//         ],
//       ),
//     );
//   }
//
//   // ========== FOOTER ==========
//   Widget _buildFooter(bool isDark, Color primaryColor) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             primaryColor.withOpacity(0.1),
//             primaryColor.withOpacity(0.05),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.flutter_dash, color: primaryColor),
//               const SizedBox(width: 8),
//               Text(
//                 "Built with Flutter",
//                 style: GoogleFonts.poppins(
//                   color: isDark ? Colors.white70 : Colors.black54,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text(
//             "© 2025 Aryan Patel. All rights reserved.",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               color: isDark ? Colors.white70 : Colors.black54,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ========== REUSABLE WIDGETS ==========
//
//   Widget _sectionTitle(String text, Color primaryColor, bool isDark) {
//     return Column(
//       children: [
//         Text(
//           text,
//           style: GoogleFonts.poppins(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: isDark ? Colors.white : Colors.black,
//           ),
//         ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
//         const SizedBox(height: 12),
//         Container(
//           width: 80,
//           height: 4,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [primaryColor, primaryColor.withOpacity(0.3)]),
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ).animate().scale(duration: 600.ms, delay: 200.ms),
//       ],
//     );
//   }
//
//   Widget _statCard(
//       String value, String label, Color primaryColor, bool isDark) {
//     return Container(
//       width: 150,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             primaryColor.withOpacity(0.2),
//             primaryColor.withOpacity(0.05)
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: primaryColor.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Text(
//             value,
//             style: GoogleFonts.poppins(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: primaryColor,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: isDark ? Colors.white70 : Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _skillCard(String name, IconData icon, double level,
//       Color primaryColor, bool isDark, bool isMobile) {
//     return Container(
//       width: isMobile ? double.infinity : 280,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: primaryColor.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: primaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(icon, color: primaryColor, size: 24),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   name,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: isDark ? Colors.white : Colors.black87,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: LinearProgressIndicator(
//               value: level,
//               minHeight: 8,
//               backgroundColor: isDark ? Colors.white10 : Colors.grey[300],
//               valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             '${(level * 100).toInt()}%',
//             style: GoogleFonts.poppins(
//               fontSize: 12,
//               color: primaryColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _experienceCard(String title, List<String> items, Color primaryColor,
//       bool isDark, bool isMobile) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 800),
//       padding: EdgeInsets.all(isMobile ? 20 : 28),
//       decoration: BoxDecoration(
//         color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: primaryColor.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: isDark ? Colors.white : Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 16),
//           ...items.map((item) => Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 6),
//                       width: 6,
//                       height: 6,
//                       decoration: BoxDecoration(
//                         color: primaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         item,
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           color: isDark ? Colors.white70 : Colors.black87,
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1);
//   }
//
//   Widget _projectCard(String title, String desc, List<String> tech,
//       IconData icon, Color primaryColor, bool isDark, bool isMobile) {
//     return Container(
//       width: isMobile ? double.infinity : 360,
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: primaryColor.withOpacity(0.3), width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: primaryColor.withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [primaryColor, primaryColor.withOpacity(0.7)],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Icon(icon, color: Colors.white, size: 28),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: isDark ? Colors.white : Colors.black87,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             desc,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               height: 1.6,
//               color: isDark ? Colors.white70 : Colors.black54,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: tech.map((t) {
//               return Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: primaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: primaryColor.withOpacity(0.3)),
//                 ),
//                 child: Text(
//                   t,
//                   style: GoogleFonts.poppins(
//                     fontSize: 12,
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: primaryColor.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: primaryColor.withOpacity(0.2)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.add_photo_alternate, size: 20, color: primaryColor),
//                 const SizedBox(width: 8),
//                 Text(
//                   "Screenshots coming soon",
//                   style: GoogleFonts.poppins(
//                     fontSize: 12,
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.9, 0.9));
//   }
//
//   Widget _gradientButton(
//       String text, IconData icon, Color primaryColor, VoidCallback onPressed) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 20),
//       label: Text(
//         text,
//         style: GoogleFonts.poppins(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//         backgroundColor: primaryColor,
//         foregroundColor: Colors.white,
//         elevation: 8,
//         shadowColor: primaryColor.withOpacity(0.5),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     );
//   }
//
//   Widget _outlineButton(String text, IconData icon, Color primaryColor,
//       bool isDark, VoidCallback onPressed) {
//     return OutlinedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 20, color: primaryColor),
//       label: Text(
//         text,
//         style: GoogleFonts.poppins(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: primaryColor,
//         ),
//       ),
//       style: OutlinedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//         side: BorderSide(color: primaryColor, width: 2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     );
//   }
//
//   Widget _socialIcon(IconData icon, Color primaryColor, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: primaryColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: primaryColor.withOpacity(0.3)),
//         ),
//         child: FaIcon(icon, color: primaryColor, size: 20),
//       ),
//     );
//   }
//
//   void _launchMail() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: 'aryanpatel1832@gmail.com',
//       queryParameters: {
//         'subject': 'Project Inquiry - Flutter Development',
//       },
//     );
//     if (await canLaunchUrl(emailLaunchUri)) {
//       await launchUrl(emailLaunchUri);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

void main() {
  runApp(const PortfolioApp());
}

// ==================== CONFIGURATION ====================
// 🔧 UPDATE YOUR DETAILS HERE - SINGLE SOURCE OF TRUTH
class Config {
  // Personal Information
  static const String name = "Aryan Patel";
  static const String role = "Flutter Developer";
  static const String tagline = "Building Beautiful Cross-Platform Experiences";
  static const String location = "Gujarat, India";
  static const String email = "aryanpatel1832@gmail.com";
  static const String phone = "+91 7203001832";

  // Social Media Links - Update with your actual profiles
  static const String linkedinUrl = "https://www.linkedin.com/in/your-profile";
  static const String githubUrl = "https://github.com/your-username";
  static const String instagramUrl = "https://www.instagram.com/your-profile";
  static const String twitterUrl = "https://twitter.com/your-profile";
  static const String portfolioUrl = "https://your-portfolio.com";
  static const String resumeUrl = "https://drive.google.com/file/d/your-resume-link";

  // About Section
  static const String aboutMe =
      "I'm a passionate Flutter developer with 2.5+ years of experience crafting beautiful, "
      "high-performance mobile applications. I specialize in creating seamless cross-platform "
      "experiences that users love. My expertise spans from complex dating platforms with real-time "
      "communication to sophisticated e-commerce solutions and event management systems.";

  // Statistics
  static const String yearsExp = "2.5+";
  static const String projectsCount = "15+";
  static const String clientsServed = "5+";
  static const String satisfaction = "100%";
}

// ==================== MAIN APP ====================
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${Config.name} | ${Config.role}',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const PortfolioHome(),
    );
  }
}

// ==================== HOME PAGE ====================
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _particleController;
  bool _showBackToTop = false;
  int _selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _scrollController.addListener(() {
      setState(() {
        _showBackToTop = _scrollController.offset > 500;
      });
    });
  }

  @override
  void dispose() {
    _particleController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    double offset = 0;
    switch (index) {
      case 0: offset = 0; break;
      case 1: offset = MediaQuery.of(context).size.height * 0.9; break;
      case 2: offset = MediaQuery.of(context).size.height * 1.8; break;
      case 3: offset = MediaQuery.of(context).size.height * 2.7; break;
      case 4: offset = MediaQuery.of(context).size.height * 3.6; break;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
    );
    setState(() => _selectedNavIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    final isTablet = size.width >= 768 && size.width < 1024;

    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          AnimatedBackground(controller: _particleController),

          // Main Content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Floating App Bar
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                backgroundColor: Colors.black.withOpacity(0.8),
                elevation: 0,
                title: Row(
                  children: [
                    _buildLogo(),
                    if (!isMobile) const SizedBox(width: 12),
                    if (!isMobile)
                      Text(
                        Config.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                  ],
                ),
                actions: [
                  if (!isMobile) ..._buildDesktopNav(),
                  if (isMobile) _buildMobileMenuButton(),
                  const SizedBox(width: 16),
                ],
              ),

              // Content Sections
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildHeroSection(isMobile, isTablet),
                    _buildAboutSection(isMobile, isTablet),
                    _buildSkillsSection(isMobile, isTablet),
                    _buildProjectsSection(isMobile, isTablet),
                    _buildContactSection(isMobile, isTablet),
                    _buildFooter(isMobile),
                  ],
                ),
              ),
            ],
          ),

          // Back to Top Button
          if (_showBackToTop)
            Positioned(
              bottom: 32,
              right: 32,
              child: _buildBackToTopButton(),
            ),
        ],
      ),
    );
  }

  // ==================== COMPONENTS ====================

  Widget _buildLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'AP',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDesktopNav() {
    final items = ['Home', 'About', 'Skills', 'Projects', 'Contact'];
    return items.asMap().entries.map((entry) {
      final isSelected = _selectedNavIndex == entry.key;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          onPressed: () => _scrollToSection(entry.key),
          style: TextButton.styleFrom(
            foregroundColor: isSelected ? const Color(0xFF6366F1) : Colors.white70,
          ),
          child: Text(
            entry.value,
            style: GoogleFonts.inter(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu_rounded),
      onPressed: () => _showMobileMenu(context),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final items = ['Home', 'About', 'Skills', 'Projects', 'Contact'];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items.asMap().entries.map((entry) {
              return ListTile(
                leading: Icon(
                  _getNavIcon(entry.key),
                  color: const Color(0xFF6366F1),
                ),
                title: Text(
                  entry.value,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(entry.key);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  IconData _getNavIcon(int index) {
    switch (index) {
      case 0: return Icons.home_rounded;
      case 1: return Icons.person_rounded;
      case 2: return Icons.code_rounded;
      case 3: return Icons.work_rounded;
      case 4: return Icons.mail_rounded;
      default: return Icons.circle;
    }
  }

  Widget _buildBackToTopButton() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: FloatingActionButton(
            onPressed: () => _scrollToSection(0),
            backgroundColor: const Color(0xFF6366F1),
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        );
      },
    );
  }

  // ==================== HERO SECTION ====================

  Widget _buildHeroSection(bool isMobile, bool isTablet) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 40,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimatedAvatar(isMobile),
            SizedBox(height: isMobile ? 32 : 48),
            _buildNameTitle(isMobile),
            SizedBox(height: isMobile ? 16 : 24),
            _buildRoleSubtitle(isMobile),
            SizedBox(height: isMobile ? 12 : 16),
            _buildLocation(isMobile),
            SizedBox(height: isMobile ? 24 : 32),
            _buildTagline(isMobile),
            SizedBox(height: isMobile ? 40 : 56),
            _buildCTAButtons(isMobile),
            SizedBox(height: isMobile ? 40 : 56),
            _buildSocialLinks(isMobile),
            // const Spacer(),
            _buildScrollIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedAvatar(bool isMobile) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: isMobile ? 140 : 180,
            height: isMobile ? 140 : 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withOpacity(0.5),
                  blurRadius: 60,
                  spreadRadius: 20,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'AP',
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 60 : 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameTitle(bool isMobile) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFEC4899)],
      ).createShader(bounds),
      child: Text(
        Config.name,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 40 : 72,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          height: 1.1,
        ),
      ),
    );
  }

  Widget _buildRoleSubtitle(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF6366F1).withOpacity(0.2),
            const Color(0xFF8B5CF6).withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        Config.role,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 18 : 28,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF6366F1),
        ),
      ),
    );
  }

  Widget _buildLocation(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_rounded,
          color: Colors.white60,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          Config.location,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }

  Widget _buildTagline(bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        Config.tagline,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 16 : 22,
          color: Colors.white70,
          height: 1.6,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildCTAButtons(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _buildPrimaryButton(
          'Hire Me',
          Icons.mail_rounded,
              () => _launchURL('mailto:${Config.email}?subject=Project Inquiry'),
        ),
        _buildSecondaryButton(
          'Download CV',
          Icons.download_rounded,
              () => _launchURL(Config.resumeUrl),
        ),
        _buildSecondaryButton(
          'View Work',
          Icons.arrow_downward_rounded,
              () => _scrollToSection(3),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(String text, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0xFF6366F1),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF6366F1), size: 20),
              const SizedBox(width: 12),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF6366F1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(bool isMobile) {
    final socials = [
      {'icon': Icons.work_rounded, 'url': Config.linkedinUrl, 'label': 'LinkedIn'},
      {'icon': Icons.code_rounded, 'url': Config.githubUrl, 'label': 'GitHub'},
      {'icon': Icons.camera_alt_rounded, 'url': Config.instagramUrl, 'label': 'Instagram'},
      {'icon': Icons.alternate_email_rounded, 'url': Config.twitterUrl, 'label': 'Twitter'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: socials.map((social) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _launchURL(social['url'] as String),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF6366F1).withOpacity(0.3),
                ),
              ),
              child: Icon(
                social['icon'] as IconData,
                color: const Color(0xFF6366F1),
                size: 24,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildScrollIndicator() {
    return Column(
      children: [
        // Text(
        //   'Scroll Down',
        //   style: GoogleFonts.inter(
        //     fontSize: 12,
        //     color: Colors.white60,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        // const SizedBox(height: 8),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(value * math.pi * 2) * 10),
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF6366F1),
                size: 32,
              ),
            );
          },
        ),
      ],
    );
  }

  // ==================== ABOUT SECTION ====================

  Widget _buildAboutSection(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          _buildSectionTitle('About Me', isMobile),
          SizedBox(height: isMobile ? 48 : 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: EdgeInsets.all(isMobile ? 32 : 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6366F1).withOpacity(0.1),
                  const Color(0xFF8B5CF6).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF6366F1).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.person_rounded,
                  size: 64,
                  color: Color(0xFF6366F1),
                ),
                const SizedBox(height: 24),
                Text(
                  Config.aboutMe,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 16 : 18,
                    color: Colors.white70,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 48 : 64),
          _buildStats(isMobile),
        ],
      ),
    );
  }

  Widget _buildStats(bool isMobile) {
    final stats = [
      {'value': Config.yearsExp, 'label': 'Years Experience'},
      {'value': Config.projectsCount, 'label': 'Projects Done'},
      {'value': Config.clientsServed, 'label': 'Happy Clients'},
      {'value': Config.satisfaction, 'label': 'Satisfaction'},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: stats.map((stat) {
        return Container(
          width: isMobile ? 150 : 250,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6366F1).withOpacity(0.2),
                const Color(0xFF8B5CF6).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF6366F1).withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Text(
                stat['value']!,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF6366F1),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                stat['label']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ==================== SKILLS SECTION ====================

  Widget _buildSkillsSection(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 80 : 120,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color(0xFF6366F1).withOpacity(0.03),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          _buildSectionTitle('Technical Skills', isMobile),
          const SizedBox(height: 16),
          Text(
            'Technologies I work with',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white60,
            ),
          ),
          SizedBox(height: isMobile ? 48 : 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildSkillsGrid(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(bool isMobile) {
    final skills = [
      {'name': 'Flutter', 'level': 95, 'icon': Icons.flutter_dash},
      {'name': 'Dart', 'level': 94, 'icon': Icons.code},
      {'name': 'Firebase', 'level': 90, 'icon': Icons.cloud},
      {'name': 'GetX', 'level': 92, 'icon': Icons.settings},
      {'name': 'Provider', 'level': 88, 'icon': Icons.storage},
      {'name': 'REST API', 'level': 91, 'icon': Icons.api},
      {'name': 'Agora SDK', 'level': 87, 'icon': Icons.videocam},
      {'name': 'WebRTC', 'level': 85, 'icon': Icons.video_call},
      {'name': 'Payment Gateway', 'level': 89, 'icon': Icons.payment},
      {'name': 'UI/UX', 'level': 93, 'icon': Icons.design_services},
      {'name': 'Animations', 'level': 90, 'icon': Icons.animation},
      {'name': 'Git/GitHub', 'level': 88, 'icon': Icons.source},
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: skills.map((skill) {
        return Container(
          width: isMobile ? double.infinity : 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF6366F1).withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      skill['icon'] as IconData,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      skill['name'] as String,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (skill['level'] as int) / 100,
                  minHeight: 8,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6366F1)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${skill['level']}%',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF6366F1),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ==================== PROJECTS SECTION ====================

  Widget _buildProjectsSection(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          _buildSectionTitle('Featured Projects', isMobile),
          const SizedBox(height: 16),
          Text(
            'Some of my recent work',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white60,
            ),
          ),
          SizedBox(height: isMobile ? 48 : 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildProjectsGrid(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(bool isMobile) {
    final projects = [
      {
        'title': 'Dating App',
        'desc': 'Complete dating platform with video/audio calls, live chat, matching algorithm, and real-time notifications using Agora SDK.',
        'tech': ['Flutter', 'Firebase', 'Agora', 'GetX'],
        'icon': Icons.favorite_rounded,
        'gradient': [Color(0xFFEC4899), Color(0xFFF43F5E)],
      },
      {
        'title': 'CricRoyal (CricHeroes Clone)',
        'desc': 'Cricket scoring app with live match updates, player statistics, tournament management, leaderboards, and social features.',
        'tech': ['Flutter', 'Firebase', 'REST API', 'Bloc'],
        'icon': Icons.sports_cricket_rounded,
        'gradient': [Color(0xFF10B981), Color(0xFF059669)],
      },
      {
        'title': 'Food Delivery Platform',
        'desc': 'Full-featured food ordering platform with restaurant listings, cart management, real-time order tracking, and payment integration.',
        'tech': ['Flutter', 'Firebase', 'Razorpay', 'GetX'],
        'icon': Icons.restaurant_rounded,
        'gradient': [Color(0xFFF59E0B), Color(0xFFEF4444)],
      },
      {
        'title': 'Event Management System',
        'desc': 'Complete event platform with cloud storage, ticket booking, file manager, attendee management, and live event updates.',
        'tech': ['Flutter', 'Firebase Storage', 'Provider', 'Stripe'],
        'icon': Icons.event_rounded,
        'gradient': [Color(0xFF8B5CF6), Color(0xFF6366F1)],
      },
      {
        'title': 'Real-Time Chat App',
        'desc': 'Advanced messaging app with group chats, media sharing, voice messages, video calls, online status, and end-to-end encryption.',
        'tech': ['Flutter', 'Firebase', 'WebRTC', 'Push Notifications'],
        'icon': Icons.chat_bubble_rounded,
        'gradient': [Color(0xFF06B6D4), Color(0xFF3B82F6)],
      },
      {
        'title': 'Live Streaming Platform',
        'desc': 'Live video streaming app with real-time comments, viewer count, gifts, monetization features, and host dashboard.',
        'tech': ['Flutter', 'Agora', 'Firebase', 'GetX'],
        'icon': Icons.live_tv_rounded,
        'gradient': [Color(0xFFEF4444), Color(0xFFDC2626)],
      },
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: projects.asMap().entries.map((entry) {
        final project = entry.value;
        return _buildProjectCard(
          project['title'] as String,
          project['desc'] as String,
          project['tech'] as List<String>,
          project['icon'] as IconData,
          project['gradient'] as List<Color>,
          isMobile,
        );
      }).toList(),
    );
  }

  Widget _buildProjectCard(
      String title,
      String desc,
      List<String> tech,
      IconData icon,
      List<Color> gradient,
      bool isMobile,
      ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: isMobile ? double.infinity : 360,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: gradient[0].withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    desc,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white60,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tech.map((t) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: gradient[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: gradient[0].withOpacity(0.5),
                          ),
                        ),
                        child: Text(
                          t,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: gradient[0],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== CONTACT SECTION ====================

  Widget _buildContactSection(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 80 : 120,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color(0xFF6366F1).withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildSectionTitle('Let\'s Work Together', isMobile),
          const SizedBox(height: 16),
          Text(
            'Have a project in mind? Let\'s build something amazing!',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 18,
              color: Colors.white60,
            ),
          ),
          SizedBox(height: isMobile ? 48 : 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: EdgeInsets.all(isMobile ? 32 : 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6366F1).withOpacity(0.1),
                  const Color(0xFF8B5CF6).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF6366F1).withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContactCard(
                      Icons.email_rounded,
                      'Email',
                      Config.email,
                          () => _launchURL('mailto:${Config.email}'),
                      isMobile,
                    ),
                    if (!isMobile) const SizedBox(width: 24),
                    if (!isMobile)
                      _buildContactCard(
                        Icons.phone_rounded,
                        'Phone',
                        Config.phone,
                            () => _launchURL('tel:${Config.phone}'),
                        isMobile,
                      ),
                  ],
                ),
                if (isMobile) const SizedBox(height: 24),
                if (isMobile)
                  _buildContactCard(
                    Icons.phone_rounded,
                    'Phone',
                    Config.phone,
                        () => _launchURL('tel:${Config.phone}'),
                    isMobile,
                  ),
                const SizedBox(height: 40),
                _buildPrimaryButton(
                  'Send Message',
                  Icons.send_rounded,
                      () => _launchURL('mailto:${Config.email}?subject=Project Inquiry'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
      IconData icon,
      String label,
      String value,
      VoidCallback onTap,
      bool isMobile,
      ) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF6366F1).withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF6366F1),
                  size: 32,
                ),
                const SizedBox(height: 12),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==================== FOOTER ====================

  Widget _buildFooter(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color(0xFF6366F1).withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildLogo(),
          const SizedBox(height: 24),
          Text(
            Config.name,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Config.role,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 24),
          _buildSocialLinks(isMobile),
          const SizedBox(height: 32),
          Divider(
            color: const Color(0xFF6366F1).withOpacity(0.2),
            thickness: 1,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                color: Color(0xFF6366F1),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Built with Flutter',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime.now().year} ${Config.name}. All rights reserved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== HELPER WIDGETS ====================

  Widget _buildSectionTitle(String title, bool isMobile) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  // ==================== UTILITY FUNCTIONS ====================

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

// ==================== ANIMATED BACKGROUND ====================

class AnimatedBackground extends StatelessWidget {
  final AnimationController controller;

  const AnimatedBackground({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            painter: ParticlePainter(controller.value),
          );
        },
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40);

    final particles = [
      {'x': 0.1, 'y': 0.2, 'color': const Color(0xFF6366F1)},
      {'x': 0.8, 'y': 0.3, 'color': const Color(0xFF8B5CF6)},
      {'x': 0.3, 'y': 0.7, 'color': const Color(0xFFEC4899)},
      {'x': 0.7, 'y': 0.8, 'color': const Color(0xFF10B981)},
      {'x': 0.5, 'y': 0.5, 'color': const Color(0xFF3B82F6)},
    ];

    for (var particle in particles) {
      final x = (particle['x'] as double) * size.width;
      final y = (particle['y'] as double) * size.height;
      final offset = math.sin(animationValue * math.pi * 2) * 50;

      paint.color = (particle['color'] as Color).withOpacity(0.15);
      canvas.drawCircle(
        Offset(x + offset, y - offset),
        80,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}