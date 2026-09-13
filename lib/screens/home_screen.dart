import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'about_screen.dart';
import 'project_screen.dart';
import 'organization_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ==========================================
              // HEADER WEBSITE
              // ==========================================
              const _SkyHeader(),

              // ==========================================
              // STICKY NAVBAR
              // Untuk sementara masih tampilan biasa.
              // Nanti kita upgrade jadi benar-benar sticky.
              // ==========================================
              _Navbar(context),

              // ==========================================
              // HERO SECTION
              // ==========================================
              const _HeroSection(),

              // ==========================================
              // HERO IMAGE
              // ==========================================
              const _HeroImageSection(),

              // ==========================================
              // FOOTER HERO
              // ==========================================
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 24, 20, 35),
                child: Text(
                  'INFORMATICS STUDENT • CREATIVE THINKER •\n'
                  'FUTURE DEVELOPER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    height: 1.6,
                    color: AppColors.ink,
                  ),
                ),
              ),

              const Divider(
                thickness: 4,
                color: AppColors.ink,
              ),

              // ==========================================
              // PREVIEW SECTIONS
              // ==========================================
              _SectionPreview(
                number: '01',
                title: 'ABOUT ME',
                subtitle: 'CHARACTER FILE #001',
                color: AppColors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),

              _SectionPreview(
                number: '02',
                title: 'PROJECTS',
                subtitle: 'MISSION ARCHIVES',
                color: AppColors.yellow,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectScreen(),
                    ),
                  );
                },
              ),

              _SectionPreview(
                number: '03',
                title: 'ORGANIZATION',
                subtitle: 'TEAM & ADVENTURES',
                color: AppColors.panelBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OrganizationScreen(),
                    ),
                  );
                },
              ),

              _SectionPreview(
                number: '04',
                title: 'CONTACT',
                subtitle: 'LET’S CONNECT!',
                color: AppColors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              const Text(
                'IKA.EXE © 2026',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SKY HEADER
// =====================================================

class _SkyHeader extends StatelessWidget {
  const _SkyHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310,
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
          // DECORATIVE COMIC LINES
          // ==========================================

          Positioned(
            top: 20,
            left: -30,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                width: 150,
                height: 3,
                color: AppColors.ink,
              ),
            ),
          ),

          Positioned(
            top: 45,
            right: -20,
            child: Transform.rotate(
              angle: 0.35,
              child: Container(
                width: 120,
                height: 3,
                color: AppColors.ink,
              ),
            ),
          ),

          // ==========================================
          // LOGO
          // ==========================================

          Positioned(
            top: 20,
            left: 20,
            child: Transform.rotate(
              angle: -0.04,
              child: Container(
                width: 70,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(5, 5),
                      color: AppColors.ink,
                    ),
                  ],
                ),
                child: Text(
                  'IKA',
                  style: GoogleFonts.bangers(
                    fontSize: 27,
                    color: AppColors.paper,
                  ),
                ),
              ),
            ),
          ),

          // ==========================================
          // BRAND
          // ==========================================

          Positioned(
            top: 25,
            left: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IKA.EXE',
                  style: GoogleFonts.bangers(
                    fontSize: 30,
                    color: AppColors.paper,
                    shadows: const [
                      Shadow(
                        offset: Offset(2, 2),
                        color: AppColors.ink,
                      ),
                    ],
                  ),
                ),

                Text(
                  'PORTFOLIO UNIVERSE',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: AppColors.paper,
                  ),
                ),
              ],
            ),
          ),

          // ==========================================
          // ISSUE BADGE
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
                  'ISSUE\n#03',
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
          // PROFILE PHOTO
          // ==========================================

          Positioned(
            top: 105,
            left: 22,
            child: Transform.rotate(
              angle: -0.02,
              child: Container(
                width: 120,
                height: 165,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.paper,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(6, 6),
                      color: AppColors.ink,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/ika1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ==========================================
          // PROFILE INFO
          // ==========================================

          Positioned(
            top: 115,
            left: 165,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IKA WAHYUNINGTYAS',
                  style: GoogleFonts.bangers(
                    fontSize: 30,
                    height: 0.9,
                    color: AppColors.paper,
                    shadows: const [
                      Shadow(
                        offset: Offset(3, 3),
                        color: AppColors.ink,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                _InfoRow(
                  icon: Icons.person,
                  text: 'NIM : MASUKKAN NIM',
                ),

                const SizedBox(height: 8),

                _InfoRow(
                  icon: Icons.school,
                  text: 'TEKNIK INFORMATIKA',
                ),

                const SizedBox(height: 8),

                _InfoRow(
                  icon: Icons.menu_book,
                  text: 'SEMESTER 3 • 2026',
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
// PROFILE INFO ROW
// =====================================================

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({
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
            size: 16,
            color: AppColors.yellow,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            text,
            style: GoogleFonts.robotoCondensed(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.paper,
              shadows: const [
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
// NAVBAR
// =====================================================

Widget _Navbar(BuildContext context) {
  return Container(
    height: 58,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.paper,
      border: const Border(
        bottom: BorderSide(
          color: AppColors.ink,
          width: 4,
        ),
      ),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 4),
          color: Color(0x22000000),
        ),
      ],
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _NavItem(
            title: 'HOME',
            active: true,
            onTap: () {},
          ),

          _NavItem(
            title: 'ABOUT',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const AboutScreen(),
                ),
              );
            },
          ),

          _NavItem(
            title: 'PROJECTS',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProjectScreen(),
                ),
              );
            },
          ),

          _NavItem(
            title: 'ORGANIZATION',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const OrganizationScreen(),
                ),
              );
            },
          ),

          _NavItem(
            title: 'CONTACT',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ContactScreen(),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active
              ? AppColors.yellow
              : AppColors.paper,
          border: const Border(
            right: BorderSide(
              color: AppColors.ink,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.robotoCondensed(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),
      ),
    );
  }
}

// =====================================================
// HERO SECTION
// =====================================================

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        20,
        38,
        20,
        20,
      ),
      child: Column(
        children: [
          Transform.rotate(
            angle: -0.02,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
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
                'THE DAILY CODE',
                style: GoogleFonts.bangers(
                  fontSize: 25,
                  color: AppColors.ink,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'THE AMAZING',
            style: GoogleFonts.bangers(
              fontSize: 44,
              color: AppColors.ink,
            ),
          ),

          Transform.rotate(
            angle: -0.03,
            child: Text(
              'IKA.EXE',
              style: GoogleFonts.bangers(
                fontSize: 58,
                color: AppColors.red,
                shadows: const [
                  Shadow(
                    offset: Offset(4, 4),
                    color: AppColors.ink,
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
// HERO IMAGE
// =====================================================

class _HeroImageSection extends StatelessWidget {
  const _HeroImageSection();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.01,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.ink,
          boxShadow: const [
            BoxShadow(
              offset: Offset(8, 8),
              color: AppColors.ink,
            ),
          ],
        ),
        child: Image.asset(
          'assets/images/ika_hero.jpeg',
          width: double.infinity,
          height: 360,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// =====================================================
// SECTION PREVIEW
// =====================================================

class _SectionPreview extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SectionPreview({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(
          20,
          18,
          20,
          0,
        ),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.ink,
            width: 4,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(6, 6),
              color: AppColors.ink,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              color: AppColors.ink,
              child: Text(
                number,
                style: GoogleFonts.bangers(
                  fontSize: 22,
                  color: AppColors.paper,
                ),
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.bangers(
                      fontSize: 28,
                      color: AppColors.ink,
                    ),
                  ),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward,
              size: 30,
            ),
          ],
        ),
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
  bool shouldRepaint(
    CustomPainter oldDelegate,
  ) {
    return false;
  }
}