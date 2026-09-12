import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'project_detail_screen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

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
                  // HEADER
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
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THE DAILY CODE',
                              style: GoogleFonts.bangers(
                                fontSize: 20,
                                letterSpacing: 1,
                              ),
                            ),
                            const Text(
                              'MISSION ARCHIVES',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Transform.rotate(
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
                            'TOP\nSECRET',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: AppColors.paper,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // TITLE
                  Transform.rotate(
                    angle: -0.02,
                    child: Text(
                      'MISSION\nARCHIVES!',
                      style: GoogleFonts.bangers(
                        fontSize: 50,
                        height: 0.82,
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

                  const SizedBox(height: 12),

                  const Text(
                    'A COLLECTION OF PROJECTS, IDEAS & DIGITAL ADVENTURES.',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // PROJECT 01
                  ProjectCard(
                    number: '01',
                    title: 'PORTFOLIO\nMOBILE APP',
                    category: 'FLUTTER DEVELOPMENT',
                    description:
                        'A personal mobile portfolio application '
                        'with a retro comic visual style.',
                    icon: Icons.phone_android,
                    color: AppColors.red,
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProjectDetailScreen(),
                      ),
                    );
                  },
                  ),

                  const SizedBox(height: 24),

                  // PROJECT 02
                  ProjectCard(
                    number: '02',
                    title: 'UI/UX\nDESIGN',
                    category: 'FIGMA PROJECT',
                    description:
                        'Designing user interfaces and creating '
                        'interactive digital experiences.',
                    icon: Icons.design_services,
                    color: AppColors.yellow,
                    onTap: () {
                      _showComingSoon(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // PROJECT 03
                  ProjectCard(
                    number: '03',
                    title: 'WEB\nPROJECT',
                    category: 'WEB DEVELOPMENT',
                    description:
                        'Building digital solutions through '
                        'modern web technologies.',
                    icon: Icons.language,
                    color: AppColors.panelBlue,
                    onTap: () {
                      _showComingSoon(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // ADD NEW PROJECT
                  _AddProjectCard(
                    onTap: () {
                      _showComingSoon(context);
                    },
                  ),

                  const SizedBox(height: 35),

                  Center(
                    child: Transform.rotate(
                      angle: -0.03,
                      child: Text(
                        'MORE MISSIONS COMING SOON...',
                        style: GoogleFonts.bangers(
                          fontSize: 20,
                          color: AppColors.ink,
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

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Project detail page coming soon!'),
      ),
    );
  }
}


// ===============================================
// PROJECT CARD
// ===============================================

class ProjectCard extends StatelessWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: number == '02' ? 0.015 : -0.012,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // SHADOW
            Positioned.fill(
              left: 7,
              top: 7,
              child: Container(
                color: AppColors.ink,
              ),
            ),

            // CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: AppColors.ink,
                  width: 4,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // NUMBER
                      Container(
                        width: 58,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.paper,
                          border: Border.all(
                            color: AppColors.ink,
                            width: 3,
                          ),
                        ),
                        child: Text(
                          number,
                          style: GoogleFonts.bangers(
                            fontSize: 27,
                            color: AppColors.ink,
                          ),
                        ),
                      ),

                      const Spacer(),

                      // ICON
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: AppColors.paper,
                          border: Border.all(
                            color: AppColors.ink,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          icon,
                          size: 30,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Text(
                    title,
                    style: GoogleFonts.bangers(
                      fontSize: 31,
                      height: 0.85,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.ink,
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: AppColors.paper,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.paper,
                        border: Border.all(
                          color: AppColors.ink,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        'OPEN FILE →',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: AppColors.ink,
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


// ===============================================
// ADD PROJECT CARD
// ===============================================

class _AddProjectCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddProjectCard({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.02,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.paper,
            border: Border.all(
              color: AppColors.ink,
              width: 3,
            ),
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle_outline,
                size: 35,
                color: AppColors.ink,
              ),

              const SizedBox(width: 12),

              Text(
                'NEW MISSION\nCOMING SOON!',
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(
                  fontSize: 21,
                  height: 0.9,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ===============================================
// BACKGROUND
// ===============================================

class _ComicBackground extends StatelessWidget {
  const _ComicBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 180,
            right: -60,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellow.withOpacity(0.18),
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            left: -60,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red.withOpacity(0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}