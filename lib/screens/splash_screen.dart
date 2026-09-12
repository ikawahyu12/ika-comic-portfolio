import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return Stack(
              children: [
                const _Halftone(
                  left: 18,
                  top: 92,
                  rows: 3,
                  columns: 4,
                  spacing: 11,
                  radius: 1.5,
                ),
                const _Halftone(
                  right: 18,
                  bottom: 112,
                  rows: 2,
                  columns: 4,
                  spacing: 12,
                  radius: 1.5,
                ),

                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _ComicHeader(),
                      const SizedBox(height: 9),
                      Transform.rotate(
                        angle: -0.018,
                        child: Text(
                          'THE AMAZING',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bangers(
                            fontSize: 35,
                            height: 0.95,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.translate(
                            offset: const Offset(5, 5),
                            child: Text(
                              'IKA.EXE',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bangers(
                                fontSize: 58,
                                height: 0.9,
                                color: AppColors.yellow,
                              ),
                            ),
                          ),
                          Text(
                            'IKA.EXE',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bangers(
                              fontSize: 58,
                              height: 0.9,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      _HeroPanel(width: width),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          _Explosion(text: 'BAM!', rotate: -0.10),
                          _Explosion(text: 'CODE!', rotate: 0.11, compact: true),
                        ],
                      ),
                      const SizedBox(height: 9),
                      Transform.rotate(
                        angle: 0.018,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 13,
                          ),
                          color: AppColors.ink,
                          child: Text(
                            'EVERY IDEA STARTS\nWITH A SINGLE LINE OF CODE.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12.5,
                              height: 1.35,
                              fontWeight: FontWeight.w800,
                              color: AppColors.paper,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'COMPUTER SCIENCE STUDENT · FLUTTER DEVELOPER',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 9.5,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 14),

_ComicButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  },
),

const SizedBox(height: 15),

const _ComicFooter(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ComicHeader extends StatelessWidget {
  const _ComicHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: -0.05,
          child: Container(
            width: 70,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(color: AppColors.ink, width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'IKA',
                  style: GoogleFonts.bangers(
                    fontSize: 14,
                    color: AppColors.paper,
                  ),
                ),
                Text(
                  'UNIVERSE',
                  style: GoogleFonts.poppins(
                    fontSize: 6.5,
                    fontWeight: FontWeight.w900,
                    color: AppColors.paper,
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'THE DAILY CODE',
              textAlign: TextAlign.center,
              style: GoogleFonts.bangers(
                fontSize: 18,
                color: AppColors.ink,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ISSUE',
              style: GoogleFonts.poppins(
                fontSize: 7,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
            ),
            Text(
              '#03',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppColors.red,
                height: 0.95,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final imageHeight = (width * 0.98).clamp(300.0, 405.0);

    return Transform.rotate(
      angle: -0.026,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.ink,
          borderRadius: BorderRadius.circular(9),
        ),
        padding: const EdgeInsets.fromLTRB(7, 7, 7, 9),
        child: Container(
          height: imageHeight,
          decoration: BoxDecoration(
            color: AppColors.panelBlue,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.ink, width: 2),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/ika_hero.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                left: 12,
                top: 16,
                child: Transform.rotate(
                  angle: -0.20,
                  child: Text(
                    '</>',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.blue.withValues(alpha: 0.35),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 14,
                bottom: 12,
                child: Transform.rotate(
                  angle: 0.12,
                  child: Text(
                    'DART',
                    style: GoogleFonts.bangers(
                      fontSize: 21,
                      color: AppColors.blue.withValues(alpha: 0.35),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Explosion extends StatelessWidget {
  const _Explosion({
    required this.text,
    required this.rotate,
    this.compact = false,
  });

  final String text;
  final double rotate;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate,
      child: ClipPath(
        clipper: _BurstClipper(),
        child: Container(
          width: compact ? 105 : 125,
          height: compact ? 62 : 70,
          color: compact ? AppColors.red : AppColors.yellow,
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.bangers(
              fontSize: compact ? 26 : 30,
              color: compact ? AppColors.paper : AppColors.red,
              shadows: const [
                Shadow(offset: Offset(1.5, 1.5), color: AppColors.ink),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ComicButton extends StatelessWidget {
  const _ComicButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 7,
            right: 0,
            bottom: 0,
            child: Container(color: AppColors.ink),
          ),
          Transform.rotate(
            angle: -0.018,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.paper,
                side: const BorderSide(color: AppColors.ink, width: 3),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                'ENTER THE PORTFOLIO  →',
                style: GoogleFonts.bangers(
                  fontSize: 23,
                  letterSpacing: 0.4,
                  color: AppColors.paper,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComicFooter extends StatelessWidget {
  const _ComicFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 2, color: AppColors.ink),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _meta('IKA.EXE'),
            _meta('ISSUE #03'),
            _meta('2026 EDITION'),
          ],
        ),
      ],
    );
  }

  Widget _meta(String text) => Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 8,
          fontWeight: FontWeight.w800,
          color: AppColors.ink,
        ),
      );
}

class _Halftone extends StatelessWidget {
  const _Halftone({
    this.left,
    this.right,
    this.top,
    this.bottom,
    required this.rows,
    required this.columns,
    required this.spacing,
    required this.radius,
  });

  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final int rows;
  final int columns;
  final double spacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final dots = <Widget>[];
    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < columns; col++) {
        dots.add(Positioned(
          left: col * spacing,
          top: row * spacing,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.ink.withValues(alpha: 0.18),
          ),
        ));
      }
    }

    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      width: columns * spacing,
      height: rows * spacing,
      child: Stack(children: dots),
    );
  }
}

class _BurstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final cx = size.width / 2;
    final cy = size.height / 2;
    const points = 20;
    final outer = size.width > size.height ? size.width / 1.8 : size.height / 1.8;
    final inner = outer * 0.70;

    for (var i = 0; i < points; i++) {
      final angle = -3.14159 / 2 + i * (3.14159 * 2 / points);
      final radius = i.isEven ? outer : inner;
      final x = cx + radius * 0.95 * MathHelper.cos(angle);
      final y = cy + radius * 0.62 * MathHelper.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class MathHelper {
  static double cos(double value) {
    return value == 0 ? 1 : _cos(value);
  }

  static double sin(double value) {
    return value == 0 ? 0 : _sin(value);
  }

  // Small approximation to avoid any dependency for this decorative shape.
  static double _cos(double x) {
    while (x > 3.141592653589793) x -= 6.283185307179586;
    while (x < -3.141592653589793) x += 6.283185307179586;
    final x2 = x * x;
    return 1 - x2 / 2 + x2 * x2 / 24 - x2 * x2 * x2 / 720;
  }

  static double _sin(double x) {
    while (x > 3.141592653589793) x -= 6.283185307179586;
    while (x < -3.141592653589793) x += 6.283185307179586;
    final x2 = x * x;
    return x - x * x2 / 6 + x * x2 * x2 / 120 - x * x2 * x2 * x2 / 5040;
  }
}
