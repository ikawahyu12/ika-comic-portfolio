import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({
    super.key,
    this.projectNumber = 'MISSION #01',
    this.title = 'PORTFOLIO APP',
    this.category = 'FLUTTER MOBILE APPLICATION',
    this.description =
        'A personal portfolio application built using Flutter '
        'with a unique comic-inspired user interface.',
    this.techStack = const [
      'Flutter',
      'Dart',
      'UI Design',
    ],
    this.githubUrl,
    this.imageAsset,
  });

  final String projectNumber;
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String? githubUrl;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            const _DetailBackground(),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                18,
                14,
                18,
                35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),

                  const SizedBox(height: 25),

                  _buildMissionBadge(),

                  const SizedBox(height: 15),

                  _buildTitle(),

                  const SizedBox(height: 25),

                  _buildProjectPoster(),

                  const SizedBox(height: 28),

                  _buildSectionTitle('MISSION BRIEF'),

                  const SizedBox(height: 12),

                  _buildDescription(),

                  const SizedBox(height: 28),

                  _buildSectionTitle('MISSION OBJECTIVES'),

                  const SizedBox(height: 12),

                  _buildObjectives(),

                  const SizedBox(height: 28),

                  _buildSectionTitle('TECH STACK'),

                  const SizedBox(height: 12),

                  _buildTechStack(),

                  const SizedBox(height: 28),

                  _buildSectionTitle('PROJECT HIGHLIGHTS'),

                  const SizedBox(height: 12),

                  _buildHighlights(),

                  const SizedBox(height: 30),

                  _buildMissionStatus(),

                  const SizedBox(height: 25),

                  _buildGithubButton(context),

                  const SizedBox(height: 20),

                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // HEADER
  // =====================================================

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.ink,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.ink,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'HERO ARCHIVES',
                style: GoogleFonts.bangers(
                  fontSize: 21,
                  color: AppColors.ink,
                ),
              ),
              const Text(
                'PROJECT INTELLIGENCE FILE',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),

        Transform.rotate(
          angle: 0.08,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: Text(
              'FILE #${projectNumber.replaceAll('MISSION #', '')}',
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w900,
                color: AppColors.paper,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // MISSION BADGE
  // =====================================================

  Widget _buildMissionBadge() {
    return Transform.rotate(
      angle: -0.025,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: AppColors.yellow,
          border: Border.all(
            color: AppColors.ink,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.ink,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Text(
          projectNumber,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
            color: AppColors.ink,
          ),
        ),
      ),
    );
  }

  // =====================================================
  // TITLE
  // =====================================================

  Widget _buildTitle() {
    return Text(
      title,
      style: GoogleFonts.bangers(
        fontSize: 48,
        height: 0.85,
        color: AppColors.ink,
        shadows: const [
          Shadow(
            offset: Offset(3, 3),
            color: AppColors.red,
          ),
        ],
      ),
    );
  }

  // =====================================================
  // PROJECT POSTER
  // =====================================================

  Widget _buildProjectPoster() {
    return Transform.rotate(
      angle: 0.012,
      child: Stack(
        children: [
          Positioned.fill(
            left: 7,
            top: 7,
            child: Container(
              color: AppColors.ink,
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.panelBlue,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    border: Border.all(
                      color: AppColors.ink,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: AppColors.paper,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Center(
  child: Container(
    width: 135,
    height: 135,
    decoration: BoxDecoration(
      color: AppColors.paper,
      border: Border.all(
        color: AppColors.ink,
        width: 4,
      ),
    ),
    child: imageAsset != null
        ? ClipRect(
            child: Image.asset(
              imageAsset!,
              width: 135,
              height: 135,
              fit: BoxFit.cover,
            ),
          )
        : const Icon(
            Icons.auto_stories_rounded,
            size: 72,
            color: AppColors.red,
          ),
  ),
),

                const SizedBox(height: 20),

                Text(
                title,
                style: GoogleFonts.bangers(
                  fontSize: 34,
                  color: AppColors.ink,
                ),
              ),

              if (projectNumber == 'MISSION #03') ...[
                const SizedBox(height: 3),

                const Text(
                  'YEAR: 2026',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                    color: AppColors.ink,
                  ),
                ),
              ],

              const SizedBox(height: 5),

              const Text(
                'PROJECT STATUS: COMPLETED',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.7,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SECTION TITLE
  // =====================================================

  Widget _buildSectionTitle(String title) {
    return Transform.rotate(
      angle: -0.015,
      child: Text(
        title,
        style: GoogleFonts.bangers(
          fontSize: 27,
          color: AppColors.ink,
        ),
      ),
    );
  }

  // =====================================================
  // DESCRIPTION
  // =====================================================

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ink,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 12,
          height: 1.6,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
    );
  }

  // =====================================================
  // OBJECTIVES
  // =====================================================

Widget _buildObjectives() {
  if (projectNumber == 'MISSION #01') {
    return Column(
      children: [
        _ObjectiveCard(
          number: '01',
          title: 'MANAGE QUEUE',
          description:
              'Help manage customer queues and workshop '
              'service orders through a web-based system.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '02',
          title: 'DIGITALIZE SERVICE',
          description:
              'Provide a digital solution to support the '
              'daily queue process at the lathe workshop.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '03',
          title: 'STORE DATA',
          description:
              'Use a database to manage and store '
              'customer and queue-related information.',
        ),
      ],
    );
  }

  if (projectNumber == 'MISSION #02') {
    return Column(
      children: [
        _ObjectiveCard(
          number: '01',
          title: 'RENTAL MANAGEMENT',
          description:
              'Support the clothing rental process through '
              'a mobile application.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '02',
          title: 'EASY ACCESS',
          description:
              'Provide a simple mobile interface for users '
              'to access clothing rental information.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '03',
          title: 'DATA MANAGEMENT',
          description:
              'Connect the application with a database to '
              'manage rental-related data.',
        ),
      ],
    );
  }

  if (projectNumber == 'MISSION #03') {
    return Column(
      children: [
        _ObjectiveCard(
          number: '01',
          title: 'SMART SOLUTION',
          description:
              'Explore an IoT-based solution for a '
              'Smart City environmental project.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '02',
          title: 'IOT INTEGRATION',
          description:
              'Combine IoT hardware and software technologies '
              'to support the project concept.',
        ),

        const SizedBox(height: 12),

        _ObjectiveCard(
          number: '03',
          title: 'COLLABORATION',
          description:
              'Develop the project through collaboration with '
              'Korean students during WFK.',
        ),
      ],
    );
  }

  return Column(
    children: [
      _ObjectiveCard(
        number: '01',
        title: 'STUDENT ATTENDANCE',
        description:
            'Plan a digital attendance system for SMK '
            'students during their PKL internship.',
      ),

      const SizedBox(height: 12),

      _ObjectiveCard(
        number: '02',
        title: 'MOBILE & WEB',
        description:
            'Provide mobile and web applications to support '
            'attendance management.',
      ),

      const SizedBox(height: 12),

      _ObjectiveCard(
        number: '03',
        title: 'EASY MONITORING',
        description:
            'Create a system that can support attendance '
            'monitoring during the PKL period.',
      ),
    ],
  );
}

  // =====================================================
  // TECH STACK
  // =====================================================

  Widget _buildTechStack() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: techStack.map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: AppColors.paper,
            border: Border.all(
              color: AppColors.ink,
              width: 3,
            ),
          ),
          child: Text(
            tech.toUpperCase(),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),
        );
      }).toList(),
    );
  }

  // =====================================================
  // HIGHLIGHTS
  // =====================================================

Widget _buildHighlights() {
  if (projectNumber == 'MISSION #01') {
    return Column(
      children: [
        _HighlightCard(
          icon: Icons.queue_rounded,
          title: 'QUEUE SYSTEM',
          description:
              'A web-based system focused on managing '
              'customer queues for a lathe workshop.',
          color: AppColors.yellow,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.language_rounded,
          title: 'WEB APPLICATION',
          description:
              'Built as a web application using JavaScript '
              'and PHP.',
          color: AppColors.panelBlue,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.storage_rounded,
          title: 'MYSQL DATABASE',
          description:
              'Uses MySQL to store and manage application '
              'data.',
          color: AppColors.red,
          lightText: true,
        ),
      ],
    );
  }

  if (projectNumber == 'MISSION #02') {
    return Column(
      children: [
        _HighlightCard(
          icon: Icons.phone_android_rounded,
          title: 'MOBILE APPLICATION',
          description:
              'A mobile application designed for a '
              'clothing rental business.',
          color: AppColors.yellow,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.checkroom_rounded,
          title: 'CLOTHING RENTAL',
          description:
              'Focused on supporting the process of '
              'renting clothing through a mobile app.',
          color: AppColors.panelBlue,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.storage_rounded,
          title: 'DATABASE',
          description:
              'Uses PHP and MySQL to support application '
              'data management.',
          color: AppColors.red,
          lightText: true,
        ),
      ],
    );
  }

  if (projectNumber == 'MISSION #03') {
    return Column(
      children: [
        _HighlightCard(
          icon: Icons.memory_rounded,
          title: 'ESP32 & IOT',
          description:
              'Explored ESP32 and IoT components as part '
              'of the Smart City project.',
          color: AppColors.yellow,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.water_drop_rounded,
          title: 'COOLING MIST',
          description:
              'Implemented a Smart City Cooling Mist concept '
              'as part of the project.',
          color: AppColors.panelBlue,
        ),

        const SizedBox(height: 12),

        _HighlightCard(
          icon: Icons.hub_rounded,
          title: 'IOT TOOLS',
          description:
              'Experimented with Three.js and Node-RED '
              'during the project development.',
          color: AppColors.red,
          lightText: true,
        ),
      ],
    );
  }

  return Column(
    children: [
      _HighlightCard(
        icon: Icons.fact_check_rounded,
        title: 'PKL ATTENDANCE',
        description:
            'A planned attendance system for SMK students '
            'during their PKL internship.',
        color: AppColors.yellow,
      ),

      const SizedBox(height: 12),

      _HighlightCard(
        icon: Icons.phone_android_rounded,
        title: 'MOBILE APP',
        description:
            'The planned system will include a mobile '
            'application for students.',
        color: AppColors.panelBlue,
      ),

      const SizedBox(height: 12),

      _HighlightCard(
        icon: Icons.web_rounded,
        title: 'WEB SYSTEM',
        description:
            'A web application will support attendance '
            'management and monitoring.',
        color: AppColors.red,
        lightText: true,
      ),
    ],
  );
}

  // =====================================================
  // STATUS
  // =====================================================

  Widget _buildMissionStatus() {
    return Transform.rotate(
      angle: 0.015,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: AppColors.ink,
          border: Border.all(
            color: AppColors.ink,
            width: 3,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 13,
              height: 13,
              decoration: const BoxDecoration(
                color: AppColors.yellow,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Text(
                'MISSION STATUS: COMPLETE',
                style: TextStyle(
                  color: AppColors.paper,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.7,
                ),
              ),
            ),

            const Icon(
              Icons.check_circle,
              color: AppColors.yellow,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // GITHUB BUTTON
  // =====================================================

  Widget _buildGithubButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (githubUrl == null || githubUrl!.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'GITHUB LINK BELUM TERSEDIA',
              ),
            ),
          );
          return;
        }

        final uri = Uri.parse(githubUrl!);

        try {
          final launched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );

          if (!launched && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'GITHUB TIDAK DAPAT DIBUKA',
                ),
              ),
            );
          }
        } catch (_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'TERJADI KESALAHAN SAAT MEMBUKA GITHUB',
                ),
              ),
            );
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: AppColors.red,
          border: Border.all(
            color: AppColors.ink,
            width: 4,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.ink,
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.code,
              color: AppColors.paper,
              size: 23,
            ),

            const SizedBox(width: 10),

            Text(
              'OPEN GITHUB',
              style: GoogleFonts.bangers(
                fontSize: 24,
                color: AppColors.paper,
                letterSpacing: 0.8,
              ),
            ),

            const SizedBox(width: 10),

            const Icon(
              Icons.arrow_forward,
              color: AppColors.paper,
              size: 23,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // FOOTER
  // =====================================================

  Widget _buildFooter() {
    return Center(
      child: Text(
        'IKA.EXE • HERO ARCHIVES • ISSUE #03',
        textAlign: TextAlign.center,
        style: GoogleFonts.bangers(
          fontSize: 15,
          color: AppColors.ink,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}


// =====================================================
// OBJECTIVE CARD
// =====================================================

class _ObjectiveCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _ObjectiveCard({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bangers(
                    fontSize: 20,
                    color: AppColors.red,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 10,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
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


// =====================================================
// HIGHLIGHT CARD
// =====================================================

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final bool lightText;

  const _HighlightCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    this.lightText = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor =
        lightText ? AppColors.paper : AppColors.ink;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ink,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.paper,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.ink,
              size: 23,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bangers(
                    fontSize: 21,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                    color: textColor,
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


// =====================================================
// BACKGROUND
// =====================================================

class _DetailBackground extends StatelessWidget {
  const _DetailBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 130,
            right: -75,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    AppColors.yellow.withOpacity(0.12),
              ),
            ),
          ),

          Positioned(
            bottom: 180,
            left: -75,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    AppColors.red.withOpacity(0.08),
              ),
            ),
          ),
        ],
      ),
    );
  }
}