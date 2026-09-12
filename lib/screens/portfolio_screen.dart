import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey organizationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,

      body: CustomScrollView(
        controller: _scrollController,

        slivers: [
          // ============================
          // STICKY NAVBAR
          // ============================

SliverAppBar(
  pinned: true,
  floating: false,
  automaticallyImplyLeading: false,

  backgroundColor: AppColors.cream,

  elevation: 5,

  toolbarHeight: 65,

  title: Row(
    children: [
      // =========================
      // LOGO
      // =========================

      InkWell(
        onTap: () {
          scrollToSection(heroKey);
        },

        child: Transform.rotate(
          angle: -0.03,

          child: Container(
            width: 58,
            height: 42,

            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: AppColors.red,

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

            child: const Text(
              'IKA',

              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),

      const SizedBox(width: 12),

      // =========================
      // BRAND
      // =========================

      const Expanded(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              'IKA.EXE',

              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
            ),

            Text(
              'PORTFOLIO UNIVERSE',

              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),

      // =========================
      // ISSUE
      // =========================

      const Text(
        'ISSUE\n#03',

        textAlign: TextAlign.center,

        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: AppColors.ink,
        ),
      ),
    ],
  ),

  // =============================
  // MENU NAVIGATION
  // =============================

  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(48),

    child: Container(
      height: 48,

      decoration: const BoxDecoration(
        color: AppColors.cream,

        border: Border(
          top: BorderSide(
            color: AppColors.ink,
            width: 2,
          ),

          bottom: BorderSide(
            color: AppColors.ink,
            width: 3,
          ),
        ),
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),

        child: Row(
          children: [

            _NavItem(
              title: 'HOME',

              onTap: () {
                scrollToSection(heroKey);
              },
            ),

            _NavItem(
              title: 'ABOUT',

              onTap: () {
                scrollToSection(aboutKey);
              },
            ),

            _NavItem(
              title: 'PROJECTS',

              onTap: () {
                scrollToSection(projectKey);
              },
            ),

            _NavItem(
              title: 'ORGANIZATION',

              onTap: () {
                scrollToSection(
                  organizationKey,
                );
              },
            ),

            _NavItem(
              title: 'CONTACT',

              onTap: () {
                scrollToSection(contactKey);
              },
            ),

            const SizedBox(width: 10),
          ],
        ),
      ),
    ),
  ),
),

          // ============================
          // HERO / SPLASH
          // ============================

          SliverToBoxAdapter(
            child: Container(
              key: heroKey,
              child: const _HeroSection(),
            ),
          ),

          // ============================
          // ABOUT
          // ============================

          SliverToBoxAdapter(
            child: Container(
              key: aboutKey,
              padding: const EdgeInsets.all(24),

              child: const _SectionCard(
                number: '01',
                title: 'ABOUT ME',
                subtitle: 'THE ORIGIN STORY',
                description:
                    'DISCOVER MY BACKGROUND, EDUCATION, '
                    'SKILLS, SOFTWARE AND TECHNOLOGY.',
                color: AppColors.red,
              ),
            ),
          ),

          // ============================
          // PROJECTS
          // ============================

          SliverToBoxAdapter(
            child: Container(
              key: projectKey,
              padding: const EdgeInsets.all(24),

              child: const _SectionCard(
                number: '02',
                title: 'PROJECTS',
                subtitle: 'MISSION ARCHIVES',
                description:
                    'EXPLORE THE PROJECTS I HAVE BUILT '
                    'AND THE TECHNOLOGIES I USED.',
                color: AppColors.yellow,
              ),
            ),
          ),

          // ============================
          // ORGANIZATION
          // ============================

          SliverToBoxAdapter(
            child: Container(
              key: organizationKey,
              padding: const EdgeInsets.all(24),

              child: const _SectionCard(
                number: '03',
                title: 'ORGANIZATION',
                subtitle: 'HERO ALLIANCES',
                description:
                    'MY EXPERIENCES, ROLES AND '
                    'CONTRIBUTIONS IN ORGANIZATIONS.',
                color: AppColors.panelBlue,
              ),
            ),
          ),

          // ============================
          // CONTACT
          // ============================

          SliverToBoxAdapter(
            child: Container(
              key: contactKey,
              padding: const EdgeInsets.all(24),

              child: const _SectionCard(
                number: '04',
                title: 'CONTACT',
                subtitle: 'CALL THE HERO!',
                description:
                    "LET'S CONNECT AND CREATE "
                    'SOMETHING AWESOME TOGETHER!',
                color: AppColors.red,
              ),
            ),
          ),

          // ============================
          // FOOTER
          // ============================

          const SliverToBoxAdapter(
            child: _Footer(),
          ),
        ],
      ),
    );
  }
}


// ==========================================
// NAV ITEM
// ==========================================

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 22,
      ),

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(4),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 12,
          ),

          child: Text(
            title,

            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.8,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}


// ==========================================
// HERO SECTION
// ==========================================

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 720,
      ),

      padding: const EdgeInsets.all(24),

      color: AppColors.cream,

      child: Column(
        children: [
          const SizedBox(height: 30),

          Text(
            'THE DAILY CODE',
            style: GoogleFonts.bangers(
              fontSize: 22,
              color: AppColors.ink,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'THE AMAZING',
            style: GoogleFonts.bangers(
              fontSize: 38,
              color: AppColors.ink,
            ),
          ),

          Text(
            'IKA.EXE',
            style: GoogleFonts.bangers(
              fontSize: 56,
              color: AppColors.red,
            ),
          ),

          const SizedBox(height: 25),

          // HERO IMAGE
          Container(
            width: double.infinity,
            height: 400,

            decoration: BoxDecoration(
              color: AppColors.panelBlue,

              border: Border.all(
                color: AppColors.ink,
                width: 5,
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
  width: double.infinity,
  height: double.infinity,
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'INFORMATICS STUDENT • '
            'CREATIVE THINKER • '
            'FUTURE DEVELOPER',

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 12,
            ),

            decoration: BoxDecoration(
              color: AppColors.red,

              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),

            child: const Text(
              'START THE ADVENTURE ↓',

              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}


// ==========================================
// SECTION CARD
// ==========================================

class _SectionCard extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  const _SectionCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: color,

        border: Border.all(
          color: AppColors.ink,
          width: 4,
        ),

        boxShadow: const [
          BoxShadow(
            color: AppColors.ink,
            offset: Offset(7, 7),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            'ISSUE #$number',

            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 15),

          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,

            child: Text(
              title,

              maxLines: 1,

              style: GoogleFonts.bangers(
                fontSize: 42,
                color: AppColors.ink,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,

            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            description,

            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'EXPLORE CHAPTER →',

            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================
// FOOTER
// ==========================================

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),

      color: AppColors.ink,

      child: const Center(
        child: Text(
          'IKA.EXE • PORTFOLIO ISSUE #03 • 2026',

          textAlign: TextAlign.center,

          style: TextStyle(
            color: AppColors.paper,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}