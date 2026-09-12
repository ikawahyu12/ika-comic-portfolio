import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            const _ComicBackground(),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                20,
                16,
                20,
                40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),

                  const SizedBox(height: 25),

                  _buildProjectTitle(),

                  const SizedBox(height: 25),

                  _buildHeroCard(),

                  const SizedBox(height: 30),

                  const ComicSection(
                    number: '01',
                    title: 'THE MISSION',
                    content:
                        'Build a personal portfolio mobile '
                        'application that presents my profile, '
                        'skills, projects, and experiences in '
                        'an interactive and visually unique way.',
                  ),

                  const SizedBox(height: 24),

                  const ComicSection(
                    number: '02',
                    title: 'MY ROLE',
                    content:
                        'UI/UX Designer and Flutter Developer. '
                        'I designed the interface, created the '
                        'comic visual concept, and implemented '
                        'the application using Flutter and Dart.',
                  ),

                  const SizedBox(height: 24),

                  _buildTechArsenal(),

                  const SizedBox(height: 24),

                  const ComicSection(
                    number: '04',
                    title: 'THE ALLIES',
                    content:
                        'This project was developed as a personal '
                        'portfolio project. The main stakeholder '
                        'and user is myself as a student and '
                        'future software developer.',
                  ),

                  const SizedBox(height: 24),

                  _buildImpactSection(),

                  const SizedBox(height: 24),

                  _buildDocumentation(),

                  const SizedBox(height: 30),

                  Center(
                    child: Transform.rotate(
                      angle: -0.03,
                      child: Text(
                        'END OF MISSION!',
                        style: GoogleFonts.bangers(
                          fontSize: 28,
                          color: AppColors.red,
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

  // =============================
  // HEADER
  // =============================

  Widget _buildHeader(BuildContext context) {
    return Row(
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

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'MISSION ARCHIVES',
                style: GoogleFonts.bangers(
                  fontSize: 22,
                ),
              ),

              const Text(
                'PROJECT DOSSIER',
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: const Text(
              'CLASSIFIED',
              style: TextStyle(
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

  // =============================
  // PROJECT TITLE
  // =============================

  Widget _buildProjectTitle() {
    return Transform.rotate(
      angle: -0.02,
      child: Text(
        'IKA COMIC\nPORTFOLIO!',
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
    );
  }

  // =============================
  // HERO CARD
  // =============================

  Widget _buildHeroCard() {
    return Transform.rotate(
      angle: 0.01,
      child: Stack(
        children: [
          Positioned.fill(
            left: 8,
            top: 8,
            child: Container(
              color: AppColors.ink,
            ),
          ),

          Container(
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.panelBlue,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.phone_android,
                    size: 100,
                    color: AppColors.paper,
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: _ComicLabel(
                    text: 'PROJECT #01',
                    color: AppColors.yellow,
                  ),
                ),

                Positioned(
                  bottom: 12,
                  right: 12,
                  child: _ComicLabel(
                    text: 'FLUTTER + DART',
                    color: AppColors.red,
                    textColor: AppColors.paper,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =============================
  // TECH ARSENAL
  // =============================

  Widget _buildTechArsenal() {
    return Transform.rotate(
      angle: 0.01,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.yellow,
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
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _NumberBadge(number: '03'),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    'TECH ARSENAL',
                    style: GoogleFonts.bangers(
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                TechChip(
                  label: 'FLUTTER',
                  icon: Icons.flutter_dash,
                ),

                TechChip(
                  label: 'DART',
                  icon: Icons.code,
                ),

                TechChip(
                  label: 'FIGMA',
                  icon: Icons.design_services,
                ),

                TechChip(
                  label: 'VS CODE',
                  icon: Icons.laptop,
                ),

                TechChip(
                  label: 'GITHUB',
                  icon: Icons.code,
                ),

                TechChip(
                  label: 'GITLAB',
                  icon: Icons.cloud,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // =============================
  // IMPACT
  // =============================

  Widget _buildImpactSection() {
    return Transform.rotate(
      angle: -0.01,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
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
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _NumberBadge(
                  number: '05',
                  color: AppColors.paper,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    'RESULT & IMPACT',
                    style: GoogleFonts.bangers(
                      fontSize: 27,
                      color: AppColors.paper,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            const _ImpactItem(
              icon: Icons.person,
              text:
                  'Provides a professional digital portfolio '
                  'that can showcase my skills and experiences.',
            ),

            const SizedBox(height: 12),

            const _ImpactItem(
              icon: Icons.code,
              text:
                  'Improves my Flutter, Dart, UI/UX, and '
                  'software development skills.',
            ),

            const SizedBox(height: 12),

            const _ImpactItem(
              icon: Icons.rocket_launch,
              text:
                  'Creates a unique personal branding identity '
                  'through a retro comic visual style.',
            ),
          ],
        ),
      ),
    );
  }

  // =============================
  // DOCUMENTATION
  // =============================

  Widget _buildDocumentation() {
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
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _NumberBadge(number: '06'),

                const SizedBox(width: 12),

                Text(
                  'DOCUMENTATION',
                  style: GoogleFonts.bangers(
                    fontSize: 27,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: _DocumentBox(
                    icon: Icons.image,
                    label: 'UI DESIGN',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _DocumentBox(
                    icon: Icons.phone_android,
                    label: 'MOBILE APP',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _DocumentBox(
                    icon: Icons.code,
                    label: 'SOURCE CODE',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _DocumentBox(
                    icon: Icons.auto_awesome,
                    label: 'PROCESS',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// ===============================================
// COMIC SECTION
// ===============================================

class ComicSection extends StatelessWidget {
  final String number;
  final String title;
  final String content;

  const ComicSection({
    super.key,
    required this.number,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.01,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.paper,
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
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _NumberBadge(number: number),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.bangers(
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              content,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ===============================================
// NUMBER BADGE
// ===============================================

class _NumberBadge extends StatelessWidget {
  final String number;
  final Color? color;

  const _NumberBadge({
    required this.number,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColors.red,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
      ),
      child: Text(
        number,
        style: GoogleFonts.bangers(
          fontSize: 24,
          color: color == null
              ? AppColors.paper
              : AppColors.ink,
        ),
      ),
    );
  }
}


// ===============================================
// TECH CHIP
// ===============================================

class TechChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const TechChip({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(
          color: AppColors.ink,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
          ),

          const SizedBox(width: 5),

          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}


// ===============================================
// IMPACT ITEM
// ===============================================

class _ImpactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ImpactItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.yellow,
            border: Border.all(
              color: AppColors.ink,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.ink,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.paper,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}


// ===============================================
// DOCUMENT BOX
// ===============================================

class _DocumentBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DocumentBox({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.panelBlue,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: AppColors.paper,
          ),

          const SizedBox(height: 8),

          Text(
            label,
            style: const TextStyle(
              color: AppColors.paper,
              fontSize: 9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}


// ===============================================
// COMIC LABEL
// ===============================================

class _ComicLabel extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _ComicLabel({
    required this.text,
    required this.color,
    this.textColor = AppColors.ink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.ink,
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: textColor,
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
            top: 200,
            right: -60,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellow.withOpacity(0.12),
              ),
            ),
          ),

          Positioned(
            bottom: 250,
            left: -70,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red.withOpacity(0.10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}