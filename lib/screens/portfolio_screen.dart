import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

// ==========================================================
// PORTFOLIO SCREEN
// ==========================================================

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
    final sectionContext = key.currentContext;

    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  void showNavigationMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),

          decoration: const BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Text(
                'MISSION MENU',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink,
                ),
              ),

              const SizedBox(height: 20),

              _MobileMenuItem(
                title: 'HOME',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(heroKey);
                },
              ),

              _MobileMenuItem(
                title: 'ABOUT ME',
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(aboutKey);
                },
              ),

              _MobileMenuItem(
                title: 'PROJECTS',
                icon: Icons.code,
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(projectKey);
                },
              ),

              _MobileMenuItem(
                title: 'ORGANIZATION',
                icon: Icons.groups,
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(organizationKey);
                },
              ),

              _MobileMenuItem(
                title: 'CONTACT',
                icon: Icons.mail,
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(contactKey);
                },
              ),
            ],
          ),
        );
      },
    );
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.red,

        onPressed: () {
          scrollToSection(contactKey);
        },

        child: const Icon(
          Icons.mail,
          color: Colors.white,
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [
              Color(0xFFD6E7F5),
              Color(0xFFEAF1F3),
              Color(0xFFFFF1C9),
              Color(0xFFFFE3A3),
            ],

            stops: [
              0.0,
              0.30,
              0.65,
              1.0,
            ],
          ),
        ),

        child: CustomScrollView(
          controller: _scrollController,

          slivers: [

            // ==========================================================
            // NAVBAR
            // ==========================================================

            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,

              backgroundColor: const Color(0xFFEAF3F8),

              elevation: 5,
              toolbarHeight: 65,

              title: Row(
                children: [
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

                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

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

              actions: [
                IconButton(
                  onPressed: showNavigationMenu,

                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.ink,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 8),
              ],
            ),

            // ==========================================================
            // HERO
            // ==========================================================

            SliverToBoxAdapter(
              child: Container(
                key: heroKey,
                child: const _HeroSection(),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),

            // ==========================================================
            // ABOUT
            // ==========================================================

            SliverToBoxAdapter(
              child: _AboutSection(
                key: aboutKey,
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 50),
            ),

            // ==========================================================
            // PROJECTS
            // ==========================================================

            SliverToBoxAdapter(
              child: _ProjectsSection(
                key: projectKey,
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),

            // ==========================================================
            // ORGANIZATION
            // ==========================================================

            SliverToBoxAdapter(
                child: _OrganizationSection(
                  key: organizationKey,
                ),
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),

            // ==========================================================
            // CONTACT
            // ==========================================================

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

            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),

            // ==========================================================
            // FOOTER
            // ==========================================================

            const SliverToBoxAdapter(
              child: _Footer(),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// HERO SECTION
// ==========================================================

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 720,
      ),

      padding: const EdgeInsets.all(24),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            Color(0xFFD7E9F7),
            Color(0xFFF4E8C8),
            Color(0xFFFFE7B0),
          ],

          stops: [
            0.0,
            0.55,
            1.0,
          ],
        ),
      ),

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

// ==========================================================
// SECTION CARD
// ==========================================================

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
        crossAxisAlignment: CrossAxisAlignment.start,

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

// ==========================================================
// PROJECTS SECTION
// ==========================================================

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 35,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Transform.rotate(
            angle: 0.02,

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 7,
              ),

              decoration: BoxDecoration(
                color: AppColors.yellow,

                border: Border.all(
                  color: AppColors.ink,
                  width: 3,
                ),
              ),

              child: const Text(
                'CHAPTER 02',

                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: AppColors.ink,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'MY\nPROJECTS!',

            style: TextStyle(
              fontSize: 48,
              height: 0.85,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'MISSION ARCHIVES & DIGITAL CREATIONS',

            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1,
              color: AppColors.red,
            ),
          ),

          const SizedBox(height: 30),

          const _ProjectCard(
            number: '01',
            title: 'PORTFOLIO APP',
            category: 'FLUTTER MOBILE APPLICATION',

            description:
                'A personal portfolio application built '
                'using Flutter with a unique comic-inspired '
                'user interface.',

            technologies: [
              'Flutter',
              'Dart',
              'UI Design',
            ],

            color: AppColors.blue,
            icon: Icons.phone_android,
          ),

          const SizedBox(height: 22),

          const _ProjectCard(
            number: '02',
            title: 'COMING SOON',
            category: 'NEXT DIGITAL MISSION',

            description:
                'New projects and experiments are currently '
                'being developed. Stay tuned for the next '
                'chapter of my coding journey.',

            technologies: [
              'Flutter',
              'Development',
              'Creative Ideas',
            ],

            color: AppColors.yellow,
            icon: Icons.rocket_launch,
          ),

          const SizedBox(height: 35),

          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColors.ink,

              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),

            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    'MORE MISSIONS ARE COMING...',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
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

// ==========================================================
// PROJECT CARD
// ==========================================================

class _ProjectCard extends StatelessWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final Color color;
  final IconData icon;

  const _ProjectCard({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: number == '01' ? -0.01 : 0.01,

      child: Stack(
        children: [
          Positioned(
            left: 7,
            top: 7,
            right: 0,
            bottom: 0,

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
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
                        'MISSION #$number',

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    Icon(
                      icon,
                      size: 32,
                      color: AppColors.ink,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  category,

                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: AppColors.red,
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  description,

                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'TECH STACK',

                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,

                  children: technologies.map((technology) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: AppColors.cream,

                        border: Border.all(
                          color: AppColors.ink,
                          width: 2,
                        ),
                      ),

                      child: Text(
                        technology,

                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          color: AppColors.ink,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 22),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.ink,

                    border: Border.all(
                      color: AppColors.ink,
                      width: 2,
                    ),
                  ),

                  child: const Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(
                        'VIEW MISSION',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                        ),
                      ),

                      SizedBox(width: 8),

                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
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

// ==========================================================
// ABOUT SECTION
// ==========================================================

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 35,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Transform.rotate(
            angle: -0.03,

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 7,
              ),

              decoration: BoxDecoration(
                color: AppColors.yellow,

                border: Border.all(
                  color: AppColors.ink,
                  width: 3,
                ),
              ),

              child: const Text(
                'CHAPTER 01',

                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: AppColors.ink,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'ABOUT\nME!',

            style: TextStyle(
              fontSize: 48,
              height: 0.85,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'THE ORIGIN STORY OF IKA.EXE',

            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.3,
              color: AppColors.red,
            ),
          ),

          const SizedBox(height: 25),

          Transform.rotate(
            angle: 0.01,

            child: Stack(
              children: [
                Positioned(
                  left: 7,
                  top: 7,
                  right: 0,
                  bottom: 0,

                  child: Container(
                    color: AppColors.ink,
                  ),
                ),

                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: AppColors.blue,

                    border: Border.all(
                      color: AppColors.ink,
                      width: 4,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.red,

                          border: Border.all(
                            color: AppColors.ink,
                            width: 2,
                          ),
                        ),

                        child: const Text(
                          'CHARACTER PROFILE',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'IKA\nWAHYUNINGTYAS',

                        style: TextStyle(
                          fontSize: 30,
                          height: 0.9,
                          fontWeight: FontWeight.w900,
                          color: AppColors.ink,
                        ),
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'An Informatics Engineering student '
                        'who loves technology, creativity, '
                        'and turning ideas into digital experiences.',

                        style: TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Row(
                        children: [
                          _StatBox(
                            number: '03',
                            label: 'SEMESTER',
                          ),

                          SizedBox(width: 10),

                          _StatBox(
                            number: 'TI',
                            label: 'MAJOR',
                          ),

                          SizedBox(width: 10),

                          _StatBox(
                            number: '∞',
                            label: 'IDEAS',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),

          const _ComicSectionTitle(
            title: 'ORIGIN STORY',
            subtitle: 'HOW THE JOURNEY BEGAN',
          ),

          const SizedBox(height: 15),

          const _StoryPanel(
            number: '01',
            title: 'THE BEGINNING',

            description:
                'My journey in technology began with curiosity. '
                'I enjoy learning how applications, systems, '
                'and digital technology can solve real problems.',

            color: AppColors.cream,
            rotation: -0.01,
          ),

          const SizedBox(height: 16),

          const _StoryPanel(
            number: '02',
            title: 'THE MISSION',

            description:
                'Currently, I am developing my skills in '
                'programming, mobile development, problem solving, '
                'and creating meaningful digital solutions.',

            color: AppColors.yellow,
            rotation: 0.01,
          ),

          const SizedBox(height: 16),

          const _StoryPanel(
            number: '03',
            title: 'THE FUTURE',

            description:
                'I want to continue growing as a technology '
                'professional and create projects that bring '
                'positive impact to people.',

            color: AppColors.red,
            rotation: -0.015,
            lightText: true,
          ),

          const SizedBox(height: 40),

          const _ComicSectionTitle(
            title: 'EDUCATION',
            subtitle: 'ACADEMIC TIMELINE',
          ),

          const SizedBox(height: 18),

          const _EducationCard(
            year: '2025 — NOW',
            title: 'INFORMATICS ENGINEERING',
            subtitle: 'UNIVERSITY STUDENT',
            color: AppColors.blue,
            icon: Icons.school,
          ),

          const SizedBox(height: 16),

          const _EducationCard(
            year: 'PREVIOUS CHAPTER',
            title: 'HIGH SCHOOL',
            subtitle: 'ACADEMIC FOUNDATION',
            color: AppColors.yellow,
            icon: Icons.menu_book,
          ),

          const SizedBox(height: 40),

          const _ComicSectionTitle(
            title: 'CORE POWERS',
            subtitle: 'MY CORE COMPETENCIES',
          ),

          const SizedBox(height: 20),

          const Wrap(
            spacing: 12,
            runSpacing: 12,

            children: [
              _SkillBadge(
                icon: Icons.code,
                label: 'PROGRAMMING',
                color: AppColors.red,
              ),

              _SkillBadge(
                icon: Icons.lightbulb,
                label: 'PROBLEM SOLVING',
                color: AppColors.yellow,
              ),

              _SkillBadge(
                icon: Icons.palette,
                label: 'CREATIVITY',
                color: AppColors.blue,
              ),

              _SkillBadge(
                icon: Icons.groups,
                label: 'TEAMWORK',
                color: AppColors.cream,
              ),
            ],
          ),

          const SizedBox(height: 40),

          const _ComicSectionTitle(
            title: 'TECH ARSENAL',
            subtitle: 'SOFTWARE & TOOLS',
          ),

          const SizedBox(height: 20),

          const _ToolCard(
            title: 'SOFTWARE',

            icon: Icons.computer,

            items: [
              'Flutter',
              'Dart',
              'Visual Studio Code',
              'Figma',
              'GitHub',
              'GitLab',
            ],

            color: AppColors.blue,
          ),

          const SizedBox(height: 18),

          const _ToolCard(
            title: 'HARDWARE',

            icon: Icons.memory,

            items: [
              'Laptop',
              'Computer',
              'Mobile Device',
            ],

            color: AppColors.yellow,
          ),

          const SizedBox(height: 45),

          Center(
            child: Transform.rotate(
              angle: -0.03,

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: AppColors.ink,

                  border: Border.all(
                    color: AppColors.ink,
                    width: 3,
                  ),
                ),

                child: const Text(
                  'TO BE CONTINUED...',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrganizationSection extends StatelessWidget {
  const _OrganizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 70, 24, 70),
      decoration: const BoxDecoration(
        color: AppColors.cream,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ComicSectionTitle(
            title: 'MY\nORGANIZATION!',
            subtitle: 'HERO ALLIANCES & TEAM MISSIONS',
          ),

          const SizedBox(height: 35),

          _OrganizationCard(
            number: '01',
            organization: 'YOUR ORGANIZATION',
            role: 'MEMBER / STAFF',
            period: '2024 — 2025',
            description:
                'Berkontribusi dalam kegiatan organisasi, '
                'bekerja sama dengan anggota tim, serta '
                'ikut menjalankan berbagai program kerja.',
            color: AppColors.blue,
          ),

          const SizedBox(height: 22),

          _OrganizationCard(
            number: '02',
            organization: 'YOUR NEXT TEAM',
            role: 'DIVISION MEMBER',
            period: '2024 — PRESENT',
            description:
                'Berperan dalam pelaksanaan kegiatan dan '
                'mendukung tim melalui komunikasi, kerja sama, '
                'serta penyelesaian tugas bersama.',
            color: AppColors.red,
          ),

          const SizedBox(height: 22),

          _OrganizationCard(
            number: '03',
            organization: 'ANOTHER ALLIANCE',
            role: 'VOLUNTEER / MEMBER',
            period: '2023 — 2024',
            description:
                'Mengembangkan pengalaman teamwork, '
                'kepemimpinan, dan tanggung jawab melalui '
                'berbagai aktivitas organisasi.',
            color: AppColors.yellow,
          ),

          const SizedBox(height: 35),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.ink,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.red,
                  offset: Offset(7, 7),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TEAMWORK = SUPERPOWER!',
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'EVERY MISSION IS BETTER '
                  'WITH THE RIGHT ALLIES.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
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

class _OrganizationCard extends StatelessWidget {
  final String number;
  final String organization;
  final String role;
  final String period;
  final String description;
  final Color color;

  const _OrganizationCard({
    required this.number,
    required this.organization,
    required this.role,
    required this.period,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.paper,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
              shape: BoxShape.circle,
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organization,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  role,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  period,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    height: 1.5,
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

// ==========================================================
// COMIC SECTION TITLE
// ==========================================================

class _ComicSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ComicSectionTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),

        const SizedBox(height: 4),

        Container(
          width: 150,
          height: 4,
          color: AppColors.red,
        ),

        const SizedBox(height: 7),

        Text(
          subtitle,

          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

// ==========================================================
// STORY PANEL
// ==========================================================

class _StoryPanel extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final Color color;
  final double rotation;
  final bool lightText;

  const _StoryPanel({
    required this.number,
    required this.title,
    required this.description,
    required this.color,
    required this.rotation,
    this.lightText = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = lightText ? Colors.white : AppColors.ink;

    return Transform.rotate(
      angle: rotation,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: color,

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

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: 45,
              height: 45,

              alignment: Alignment.center,

              decoration: const BoxDecoration(
                color: AppColors.ink,
                shape: BoxShape.circle,
              ),

              child: Text(
                number,

                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
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

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    description,

                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                      color: textColor,
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

// ==========================================================
// EDUCATION CARD
// ==========================================================

class _EducationCard extends StatelessWidget {
  final String year;
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  const _EducationCard({
    required this.year,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.01,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: color,

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

        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,

              decoration: BoxDecoration(
                color: AppColors.cream,

                border: Border.all(
                  color: AppColors.ink,
                  width: 3,
                ),
              ),

              child: Icon(
                icon,
                color: AppColors.ink,
                size: 30,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    year,

                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: AppColors.red,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,

                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: AppColors.ink,
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

// ==========================================================
// STAT BOX
// ==========================================================

class _StatBox extends StatelessWidget {
  final String number;
  final String label;

  const _StatBox({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: AppColors.cream,

          border: Border.all(
            color: AppColors.ink,
            width: 2,
          ),
        ),

        child: Column(
          children: [
            Text(
              number,

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.red,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              label,

              style: const TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// SKILL BADGE
// ==========================================================

class _SkillBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SkillBadge({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 11,
      ),

      decoration: BoxDecoration(
        color: color,

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

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            size: 17,
            color: AppColors.ink,
          ),

          const SizedBox(width: 7),

          Text(
            label,

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

// ==========================================================
// TOOL CARD
// ==========================================================

class _ToolCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;
  final Color color;

  const _ToolCard({
    required this.title,
    required this.icon,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: color,

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
          Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: AppColors.ink,
              ),

              const SizedBox(width: 10),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: items.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),

                decoration: BoxDecoration(
                  color: AppColors.cream,

                  border: Border.all(
                    color: AppColors.ink,
                    width: 2,
                  ),
                ),

                child: Text(
                  item,

                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: AppColors.ink,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ==========================================================
// MOBILE MENU ITEM
// ==========================================================

class _MobileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: AppColors.yellow,

        border: Border.all(
          color: AppColors.ink,
          width: 3,
        ),
      ),

      child: InkWell(
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(14),

          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.ink,
                size: 24,
              ),

              const SizedBox(width: 15),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.arrow_forward,
                color: AppColors.ink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// FOOTER
// ==========================================================

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