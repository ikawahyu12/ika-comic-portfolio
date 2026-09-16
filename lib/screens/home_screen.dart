import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onEnterPortfolio;

  const HomeScreen({
    super.key,
    required this.onEnterPortfolio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _ComicCover(),

              const SizedBox(height: 25),

              const _CoverIntroduction(),

              const SizedBox(height: 25),

              _EnterPortfolioButton(
                  onPressed: onEnterPortfolio,
                ),

              const SizedBox(height: 35),

              const _QuickInfo(),

              const SizedBox(height: 30),

              const Text(
                'SWIPE • EXPLORE • DISCOVER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                  color: AppColors.ink,
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// COMIC COVER
// =====================================================

class _ComicCover extends StatelessWidget {
  const _ComicCover();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 570,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3B82C4),
            Color(0xFF6F6FC4),
            Color(0xFFE58B75),
            Color(0xFFFFC857),
          ],
        ),
      ),
      child: Stack(
        children: [
          // ==========================================
          // COMIC SPEED LINES
          // ==========================================

          Positioned(
            top: 95,
            left: -30,
            child: Transform.rotate(
              angle: -0.25,
              child: Container(
                width: 180,
                height: 4,
                color: AppColors.ink,
              ),
            ),
          ),

          Positioned(
            top: 130,
            right: -45,
            child: Transform.rotate(
              angle: 0.3,
              child: Container(
                width: 190,
                height: 4,
                color: AppColors.ink,
              ),
            ),
          ),

          Positioned(
            top: 205,
            left: -60,
            child: Transform.rotate(
              angle: 0.2,
              child: Container(
                width: 150,
                height: 3,
                color: AppColors.ink,
              ),
            ),
          ),

          Positioned(
            top: 250,
            right: -50,
            child: Transform.rotate(
              angle: -0.25,
              child: Container(
                width: 170,
                height: 3,
                color: AppColors.ink,
              ),
            ),
          ),

          // ==========================================
          // TOP LOGO
          // ==========================================

          Positioned(
            top: 20,
            left: 20,
            child: Transform.rotate(
              angle: -0.04,
              child: Container(
                width: 70,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.ink,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Text(
                  'IKA',
                  style: GoogleFonts.bangers(
                    fontSize: 28,
                    color: AppColors.paper,
                  ),
                ),
              ),
            ),
          ),

          // ==========================================
          // ISSUE
          // ==========================================

          Positioned(
            top: 20,
            right: 20,
            child: Transform.rotate(
              angle: 0.08,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 3,
                  ),
                ),
                child: Text(
                  'ISSUE\n#01',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bangers(
                    fontSize: 18,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ),
          ),

          // ==========================================
          // BRAND TITLE
          // ==========================================

          Positioned(
            top: 88,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  'THE AMAZING',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bangers(
                    fontSize: 38,
                    color: AppColors.paper,
                    shadows: const [
                      Shadow(
                        offset: Offset(3, 3),
                        color: AppColors.ink,
                      ),
                    ],
                  ),
                ),

                Transform.rotate(
                  angle: -0.025,
                  child: Text(
                    'IKA.EXE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bangers(
                      fontSize: 66,
                      height: 0.9,
                      color: AppColors.red,
                      shadows: const [
                        Shadow(
                          offset: Offset(5, 5),
                          color: AppColors.ink,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'PORTFOLIO UNIVERSE',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: AppColors.paper,
                  ),
                ),
              ],
            ),
          ),

          // ==========================================
          // PROFILE PHOTO
          Positioned(
            top: 235,
            left: 30,
            child: Transform.rotate(
              angle: -0.025,
              child: Container(
                width: 170,
                height: 225,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.paper,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.ink,
                      offset: Offset(8, 8),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/ika_hero.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ==========================================
          // CHARACTER INFO
          // ==========================================

          Positioned(
            top: 260,
            left: 215,
            right: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IKA',
                  style: GoogleFonts.bangers(
                    fontSize: 46,
                    height: 0.8,
                    color: AppColors.paper,
                    shadows: const [
                      Shadow(
                        offset: Offset(3, 3),
                        color: AppColors.ink,
                      ),
                    ],
                  ),
                ),

               Text(
                'WAHYUNINGTYAS',
                style: GoogleFonts.bangers(
                  fontSize: 21,
                  height: 0.9,
                  color: AppColors.ink,
                ),
              ),

                const SizedBox(height: 18),

                const _CoverInfo(
                  icon: Icons.school,
                  text: 'INFORMATICS STUDENT',
                ),

                const SizedBox(height: 8),

                const _CoverInfo(
                  icon: Icons.code,
                  text: 'FUTURE DEVELOPER',
                ),

                const SizedBox(height: 8),

                const _CoverInfo(
                  icon: Icons.auto_awesome,
                  text: 'CREATIVE THINKER',
                ),
              ],
            ),
          ),

          // ==========================================
          // CITY SILHOUETTE
          // ==========================================

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 65,
              child: CustomPaint(
                painter: _CityPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// COVER INFO
// =====================================================

class _CoverInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CoverInfo({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.ink,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 15,
            color: AppColors.yellow,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: AppColors.paper,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  color: AppColors.ink,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// =====================================================
// INTRODUCTION
// =====================================================

class _CoverIntroduction extends StatelessWidget {
  const _CoverIntroduction();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Transform.rotate(
            angle: -0.015,
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
                children: [
                  Text(
                    'WELCOME TO MY UNIVERSE!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bangers(
                      fontSize: 28,
                      color: AppColors.red,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'A digital comic-book portfolio documenting '
                    'my journey, projects, skills, and adventures '
                    'in the world of technology.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// ENTER PORTFOLIO BUTTON
// =====================================================

// =====================================================
// ENTER PORTFOLIO BUTTON
// =====================================================

class _EnterPortfolioButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _EnterPortfolioButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Transform.rotate(
          angle: -0.015,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_stories,
                  color: AppColors.paper,
                  size: 24,
                ),

                const SizedBox(width: 10),

                Text(
                  'ENTER PORTFOLIO',
                  style: GoogleFonts.bangers(
                    fontSize: 27,
                    color: AppColors.paper,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(width: 10),

                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.paper,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// QUICK INFO
// =====================================================

class _QuickInfo extends StatelessWidget {
  const _QuickInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _QuickInfoBox(
              number: '01',
              label: 'ABOUT',
              color: AppColors.yellow,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _QuickInfoBox(
              number: '03',
              label: 'PROJECTS',
              color: AppColors.panelBlue,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _QuickInfoBox(
              number: '03',
              label: 'ORG',
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// QUICK INFO BOX
// =====================================================

class _QuickInfoBox extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const _QuickInfoBox({
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: GoogleFonts.bangers(
              fontSize: 20,
              color: AppColors.ink,
            ),
          ),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// CITY PAINTER
// =====================================================

class _CityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF152238);

    final buildings = [
      const Rect.fromLTWH(0, 25, 28, 40),
      const Rect.fromLTWH(30, 15, 35, 50),
      const Rect.fromLTWH(70, 30, 25, 35),
      const Rect.fromLTWH(100, 5, 38, 60),
      const Rect.fromLTWH(145, 20, 30, 45),
      const Rect.fromLTWH(180, 28, 25, 37),
      const Rect.fromLTWH(210, 10, 40, 55),
      const Rect.fromLTWH(260, 25, 35, 40),
      const Rect.fromLTWH(300, 0, 35, 65),
      const Rect.fromLTWH(340, 20, 35, 45),
      const Rect.fromLTWH(380, 10, 35, 55),
    ];

    for (final building in buildings) {
      canvas.drawRect(building, paint);
    }

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        60,
        size.width,
        10,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}