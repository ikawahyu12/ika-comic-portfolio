import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onEnterPortfolio;

  const HomeScreen({super.key, required this.onEnterPortfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _ComicCover(),

              const SizedBox(height: 25),

              const _CoverIntroduction(),

              const SizedBox(height: 25),

              _EnterPortfolioButton(onPressed: onEnterPortfolio),

              const SizedBox(height: 35),

              const _QuickInfo(),

              const SizedBox(height: 30),

              Text(
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final gradient = isDark
        ? const [Color(0xFF071426), Color(0xFF102A56), Color(0xFF251B46)]
        : const [
            Color(0xFF3B82C4),
            Color(0xFF6F6FC4),
            Color(0xFFE58B75),
            Color(0xFFFFC857),
          ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : 600.0;
        final contentWidth = math.min(availableWidth, 620.0);
        final photoWidth = math.min(contentWidth * 0.56, 205.0);
        final titleSize = math.min(contentWidth * 0.17, 66.0);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradient,
              stops: isDark ? const [0, 0.52, 1] : null,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _CoverAtmospherePainter(isDark: isDark),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentWidth),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 86),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.rotate(
                              angle: -0.04,
                              child: Container(
                                width: 70,
                                height: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.red,
                                  border: Border.all(
                                    color: AppColors.outline,
                                    width: 4,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.outline,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'IKA',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: AppColors.paper,
                                  ),
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: 0.08,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  border: Border.all(
                                    color: AppColors.outline,
                                    width: 3,
                                  ),
                                ),
                                child: Text(
                                  'ISSUE\n#01',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.outline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'THE AMAZING',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: math.min(contentWidth * 0.105, 42.0),
                            color: AppColors.paper,
                            shadows: const [
                              Shadow(
                                offset: Offset(3, 3),
                                color: AppColors.outline,
                              ),
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: -0.025,
                          child: Text(
                            'IKA.EXE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: titleSize,
                              height: 0.9,
                              color: AppColors.red,
                              shadows: const [
                                Shadow(
                                  offset: Offset(5, 5),
                                  color: AppColors.outline,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'PORTFOLIO UNIVERSE',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            color: AppColors.paper,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Transform.rotate(
                          angle: -0.025,
                          child: Container(
                            width: photoWidth,
                            height: photoWidth * 1.32,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.paper,
                              border: Border.all(
                                color: AppColors.outline,
                                width: 4,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.outline,
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
                        const SizedBox(height: 22),
                        Text(
                          'IKA WAHYUNINGTYAS',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: math.min(contentWidth * 0.09, 32.0),
                            color: AppColors.paper,
                            letterSpacing: 1,
                            shadows: const [
                              Shadow(
                                offset: Offset(3, 3),
                                color: AppColors.outline,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
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
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 65,
                  child: CustomPaint(painter: _CityPainter()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// =====================================================
// COVER INFO
// =====================================================

class _CoverInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CoverInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.outline,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 15, color: AppColors.yellow),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: AppColors.paper,
              shadows: [Shadow(offset: Offset(1, 1), color: AppColors.outline)],
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                color: isDark ? AppColors.darkSurface : AppColors.paper,
                border: Border.all(color: AppColors.outline, width: 4),
                boxShadow: const [
                  BoxShadow(color: AppColors.outline, offset: Offset(6, 6)),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'WELCOME TO MY UNIVERSE!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: AppColors.red),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'A digital comic-book portfolio documenting '
                    'my journey, projects, skills, and adventures '
                    'in the world of technology.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: isDark ? AppColors.ink : AppColors.outline,
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

  const _EnterPortfolioButton({required this.onPressed});

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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(color: AppColors.outline, width: 4),
              boxShadow: const [
                BoxShadow(color: AppColors.outline, offset: Offset(6, 6)),
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

                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'ENTER PORTFOLIO',
                      style: TextStyle(
                        fontSize: 27,
                        color: AppColors.paper,
                        letterSpacing: 1,
                      ),
                    ),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: isDark ? Colors.white : AppColors.outline,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 20, color: AppColors.outline),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: AppColors.outline,
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

// =====================================================
// CITY PAINTER
// =====================================================

class _CityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF152238);

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

    canvas.drawRect(Rect.fromLTWH(0, 60, size.width, 10), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _CoverAtmospherePainter extends CustomPainter {
  final bool isDark;

  const _CoverAtmospherePainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    if (isDark) {
      final starPaint = Paint()
        ..color = const Color(0xFFFFF4D6).withValues(alpha: 0.52);
      final stars = [
        Offset(size.width * 0.12, size.height * 0.16),
        Offset(size.width * 0.85, size.height * 0.12),
        Offset(size.width * 0.08, size.height * 0.39),
        Offset(size.width * 0.91, size.height * 0.47),
        Offset(size.width * 0.15, size.height * 0.69),
        Offset(size.width * 0.88, size.height * 0.76),
      ];

      for (final star in stars) {
        canvas.drawCircle(star, 1.7, starPaint);
      }

      final moonPaint = Paint()
        ..color = const Color(0xFFFFE7A8).withValues(alpha: 0.42);
      canvas.drawCircle(
        Offset(size.width * 0.88, size.height * 0.27),
        14,
        moonPaint,
      );
      canvas.drawCircle(
        Offset(size.width * 0.895, size.height * 0.255),
        13,
        Paint()..color = const Color(0xFF102A56),
      );
      return;
    }

    final linePaint = Paint()
      ..color = AppColors.outline.withValues(alpha: 0.35)
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(-12, size.height * 0.30),
      Offset(size.width * 0.18, size.height * 0.27),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.82, size.height * 0.36),
      Offset(size.width + 12, size.height * 0.39),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(_CoverAtmospherePainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}
