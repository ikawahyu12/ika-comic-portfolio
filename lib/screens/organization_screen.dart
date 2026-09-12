import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            const _ComicBackground(),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),

                  const SizedBox(height: 28),

                  _buildTitle(),

                  const SizedBox(height: 10),

                  const Text(
                    'MY EXPERIENCES, ROLES, CONTRIBUTIONS, '
                    'AND IMPACT IN ORGANIZATIONS.',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                    ),
                  ),

                  const SizedBox(height: 30),

                  OrganizationCard(
                    number: '01',
                    organizationName: 'ORGANIZATION\nNAME',
                    role: 'YOUR ROLE / POSITION',
                    period: '2025 — PRESENT',
                    color: AppColors.red,
                    icon: Icons.groups,
                    responsibilities: const [
                      'Managing organizational activities',
                      'Working together with team members',
                      'Participating in organizational programs',
                    ],
                  ),

                  const SizedBox(height: 28),

                  OrganizationCard(
                    number: '02',
                    organizationName: 'CAMPUS\nCOMMUNITY',
                    role: 'MEMBER / COMMITTEE',
                    period: '2024 — 2025',
                    color: AppColors.yellow,
                    icon: Icons.people,
                    responsibilities: const [
                      'Supporting community programs',
                      'Helping organize events',
                      'Collaborating with other members',
                    ],
                  ),

                  const SizedBox(height: 28),

                  _buildImpactCard(),

                  const SizedBox(height: 30),

                  Center(
                    child: Transform.rotate(
                      angle: -0.03,
                      child: Text(
                        'TEAMWORK MAKES THE HERO!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bangers(
                          fontSize: 25,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'THE DAILY CODE',
                style: GoogleFonts.bangers(
                  fontSize: 21,
                ),
              ),
              const Text(
                'HERO ALLIANCES',
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
              horizontal: 9,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: AppColors.panelBlue,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: const Text(
              'TEAM\nFILE',
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
    );
  }

  // =====================================================
  // TITLE
  // =====================================================

  Widget _buildTitle() {
    return Transform.rotate(
      angle: -0.02,
      child: Text(
        'HERO\nALLIANCES!',
        style: GoogleFonts.bangers(
          fontSize: 52,
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
    );
  }

  // =====================================================
  // IMPACT CARD
  // =====================================================

  Widget _buildImpactCard() {
    return Transform.rotate(
      angle: -0.01,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.panelBlue,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MY SUPERPOWERS\nUNLOCKED!',
              style: GoogleFonts.bangers(
                fontSize: 30,
                height: 0.9,
                color: AppColors.paper,
              ),
            ),

            const SizedBox(height: 20),

            const ImpactRow(
              icon: Icons.groups,
              title: 'TEAMWORK',
              description:
                  'Learned how to collaborate and communicate '
                  'effectively with different people.',
            ),

            const SizedBox(height: 15),

            const ImpactRow(
              icon: Icons.record_voice_over,
              title: 'COMMUNICATION',
              description:
                  'Improved communication skills through '
                  'discussions and organizational activities.',
            ),

            const SizedBox(height: 15),

            const ImpactRow(
              icon: Icons.psychology,
              title: 'PROBLEM SOLVING',
              description:
                  'Learned to analyze problems and find '
                  'solutions together with a team.',
            ),

            const SizedBox(height: 15),

            const ImpactRow(
              icon: Icons.rocket_launch,
              title: 'LEADERSHIP',
              description:
                  'Developed responsibility, initiative, '
                  'and confidence.',
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================
// ORGANIZATION CARD
// =====================================================

class OrganizationCard extends StatelessWidget {
  final String number;
  final String organizationName;
  final String role;
  final String period;
  final Color color;
  final IconData icon;
  final List<String> responsibilities;

  const OrganizationCard({
    super.key,
    required this.number,
    required this.organizationName,
    required this.role,
    required this.period,
    required this.color,
    required this.icon,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: number == '01' ? 0.012 : -0.015,
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
              color: color,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
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
                        ),
                      ),
                    ),

                    const Spacer(),

                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.paper,
                        border: Border.all(
                          color: AppColors.ink,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        icon,
                        size: 29,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Text(
                  organizationName,
                  style: GoogleFonts.bangers(
                    fontSize: 32,
                    height: 0.85,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.ink,
                  ),
                  child: Text(
                    role,
                    style: const TextStyle(
                      color: AppColors.paper,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 17,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      period,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Text(
                  'MISSION LOG:',
                  style: GoogleFonts.bangers(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10),

                ...responsibilities.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '✦',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

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
                      'VIEW DOSSIER →',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
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
// IMPACT ROW
// =====================================================

class ImpactRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ImpactRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.bangers(
                  fontSize: 19,
                  color: AppColors.yellow,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                description,
                style: const TextStyle(
                  fontSize: 11,
                  height: 1.35,
                  fontWeight: FontWeight.w600,
                  color: AppColors.paper,
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
            top: 180,
            right: -70,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellow.withOpacity(0.12),
              ),
            ),
          ),

          Positioned(
            bottom: 180,
            left: -60,
            child: Container(
              width: 140,
              height: 140,
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