import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            const _ComicBackground(),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =========================
                  // HEADER
                  // =========================
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            border: Border.all(
                              color: AppColors.ink,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.ink,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THE DAILY CODE',
                              style: GoogleFonts.bangers(
                                fontSize: 20,
                                color: AppColors.ink,
                                letterSpacing: 1,
                              ),
                            ),
                            const Text(
                              'CHARACTER FILE #001',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      _IssueBadge(),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // =========================
                  // TITLE
                  // =========================
                  Transform.rotate(
                    angle: -0.015,
                    child: Text(
                      'THE AMAZING\nIKA!',
                      style: GoogleFonts.bangers(
                        fontSize: 48,
                        height: 0.85,
                        color: AppColors.red,
                        shadows: const [
                          Shadow(
                            offset: Offset(3, 3),
                            color: AppColors.ink,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'ORIGIN STORY • SKILLS • EDUCATION',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // =========================
                  // PROFILE CARD
                  // =========================
                  const _ProfileCard(),

                  const SizedBox(height: 28),

                  // =========================
                  // EDUCATION
                  // =========================
                  const _SectionTitle(
                    number: '01',
                    title: 'ORIGIN STORY',
                    subtitle: 'EDUCATION TIMELINE',
                  ),

                  const SizedBox(height: 16),

                  const _EducationTimeline(),

                  const SizedBox(height: 30),

                  // =========================
                  // CORE COMPETENCIES
                  // =========================
                  const _SectionTitle(
                    number: '02',
                    title: 'SUPERPOWERS!',
                    subtitle: 'CORE COMPETENCIES',
                  ),

                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      _SkillBadge(
                        title: 'PROBLEM\nSOLVING',
                        icon: Icons.psychology,
                        color: AppColors.red,
                      ),
                      _SkillBadge(
                        title: 'TEAM\nWORK',
                        icon: Icons.groups,
                        color: AppColors.yellow,
                      ),
                      _SkillBadge(
                        title: 'UI/UX\nDESIGN',
                        icon: Icons.palette,
                        color: AppColors.panelBlue,
                      ),
                      _SkillBadge(
                        title: 'CODING',
                        icon: Icons.code,
                        color: AppColors.paper,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // =========================
                  // SOFTWARE
                  // =========================
                  const _SectionTitle(
                    number: '03',
                    title: 'TECH ARSENAL',
                    subtitle: 'SOFTWARE & TOOLS',
                  ),

                  const SizedBox(height: 16),

                  const _ToolPanel(
                    title: 'SOFTWARE',
                    icon: Icons.computer,
                    color: AppColors.red,
                    tools: [
                      'Visual Studio Code',
                      'Android Studio',
                      'Figma',
                      'Flutter',
                      'Dart',
                      'GitHub',
                    ],
                  ),

                  const SizedBox(height: 18),

                  // =========================
                  // HARDWARE
                  // =========================
                  const _ToolPanel(
                    title: 'HARDWARE',
                    icon: Icons.memory,
                    color: AppColors.yellow,
                    tools: [
                      'Laptop',
                      'Smartphone',
                      'Computer',
                      'Basic Networking Device',
                    ],
                  ),

                  const SizedBox(height: 30),

                  // =========================
                  // ENDING
                  // =========================
                  Center(
                    child: Transform.rotate(
                      angle: 0.03,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          border: Border.all(
                            color: AppColors.ink,
                            width: 3,
                          ),
                        ),
                        child: Text(
                          'TO BE CONTINUED...',
                          style: GoogleFonts.bangers(
                            fontSize: 22,
                            color: AppColors.paper,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
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


// =====================================================
// PROFILE CARD
// =====================================================

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.015,
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
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.paper,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AVATAR
                    Container(
                      width: 105,
                      height: 125,
                      decoration: BoxDecoration(
                        color: AppColors.panelBlue,
                        border: Border.all(
                          color: AppColors.ink,
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 65,
                          color: AppColors.ink,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IKA\nWAHYUNINGTYAS',
                            style: GoogleFonts.bangers(
                              fontSize: 27,
                              height: 0.9,
                              color: AppColors.ink,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            color: AppColors.red,
                            child: const Text(
                              'INFORMATICS STUDENT',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: AppColors.paper,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                const Divider(
                  thickness: 2,
                  color: AppColors.ink,
                ),

                const SizedBox(height: 10),

                const Text(
                  'A third-semester Informatics Engineering student '
                  'who is exploring technology, programming, mobile '
                  'application development, and creative digital design.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.rotate(
                    angle: 0.08,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border: Border.all(
                          color: AppColors.ink,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'POW! FUTURE DEVELOPER',
                        style: GoogleFonts.bangers(
                          fontSize: 16,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
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
// SECTION TITLE
// =====================================================

class _SectionTitle extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.red,
            border: Border.all(
              color: AppColors.ink,
              width: 3,
            ),
          ),
          child: Text(
            number,
            style: GoogleFonts.bangers(
              fontSize: 22,
              color: AppColors.paper,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.bangers(
                  fontSize: 27,
                  color: AppColors.ink,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// =====================================================
// EDUCATION TIMELINE
// =====================================================

class _EducationTimeline extends StatelessWidget {
  const _EducationTimeline();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EducationCard(
          year: 'NOW',
          title: 'INFORMATICS ENGINEERING',
          subtitle: 'SEMESTER 3',
          color: AppColors.red,
        ),

        SizedBox(height: 14),

        _EducationCard(
          year: '2023',
          title: 'GRADUATED HIGH SCHOOL',
          subtitle: 'THE NEXT CHAPTER BEGINS!',
          color: AppColors.yellow,
        ),

        SizedBox(height: 14),

        _EducationCard(
          year: 'PAST',
          title: 'SCHOOL JOURNEY',
          subtitle: 'LEARNING • GROWING • EXPLORING',
          color: AppColors.panelBlue,
        ),
      ],
    );
  }
}


class _EducationCard extends StatelessWidget {
  final String year;
  final String title;
  final String subtitle;
  final Color color;

  const _EducationCard({
    required this.year,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.01,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.ink,
            width: 3,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.paper,
                border: Border.all(
                  color: AppColors.ink,
                  width: 2,
                ),
              ),
              child: Text(
                year,
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(
                  fontSize: 17,
                  color: AppColors.ink,
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.bangers(
                      fontSize: 19,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                    ),
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


// =====================================================
// SKILL BADGE
// =====================================================

class _SkillBadge extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SkillBadge({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.02,
      child: Container(
        width: 175,
        height: 130,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.ink,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: AppColors.ink,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.bangers(
                fontSize: 19,
                height: 0.9,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================
// TOOLS PANEL
// =====================================================

class _ToolPanel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> tools;

  const _ToolPanel({
    required this.title,
    required this.icon,
    required this.color,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.01,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.paper,
          border: Border.all(
            color: AppColors.ink,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: AppColors.ink,
                      width: 3,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(width: 14),

                Text(
                  title,
                  style: GoogleFonts.bangers(
                    fontSize: 27,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tools
                  .map(
                    (tool) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        border: Border.all(
                          color: AppColors.ink,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        tool,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================
// ISSUE BADGE
// =====================================================

class _IssueBadge extends StatelessWidget {
  const _IssueBadge();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.08,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.red,
          border: Border.all(
            color: AppColors.ink,
            width: 2,
          ),
        ),
        child: const Text(
          'VOL.\n03',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: AppColors.paper,
          ),
        ),
      ),
    );
  }
}


// =====================================================
// BACKGROUND
// =====================================================

class _ComicBackground extends StatelessWidget {
  const _ComicBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 200,
            right: -70,
            child: Transform.rotate(
              angle: math.pi / 8,
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.yellow.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 250,
            left: -60,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0x22D92832),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}