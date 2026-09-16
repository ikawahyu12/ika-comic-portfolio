import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_detail_screen.dart';

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
  final PageController _pageController = PageController();

  int _currentPage = 0;

  static const int _totalPages = 3;

  void _goToPage(int page) {
    if (page < 0 || page >= _totalPages) return;

    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _goToPage(_currentPage - 1);
  }

  void _nextPage() {
    _goToPage(_currentPage + 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            const _PortfolioHeader(),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: const [
                  SingleChildScrollView(
                    child: _AboutSection(),
                  ),
                  SingleChildScrollView(
                    child: _ProjectsSection(),
                  ),
                  SingleChildScrollView(
                    child: _OrganizationSection(),
                  ),
                ],
              ),
            ),

            _PortfolioPageIndicator(
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),

            const SizedBox(height: 10),

            _PortfolioNavigation(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPrevious: _previousPage,
              onNext: _nextPage,
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// PORTFOLIO HEADER
// ==========================================================

class _PortfolioHeader extends StatelessWidget {
  const _PortfolioHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border(
          bottom: BorderSide(
            color: AppColors.ink,
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),
            child: const Text(
              'IKA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          const SizedBox(width: 10),

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PORTFOLIO',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink,
                ),
              ),
              Text(
                'HERO ARCHIVES',
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: AppColors.red,
                ),
              ),
            ],
          ),

          const Spacer(),

          const Text(
            'ISSUE\n#03',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
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
// PAGE INDICATOR
// ==========================================================

class _PortfolioPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _PortfolioPageIndicator({
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) {
          final bool isActive = index == currentPage;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.red
                  : AppColors.ink.withValues(alpha: 0.25),
              border: Border.all(
                color: AppColors.ink,
                width: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================================
// PORTFOLIO NAVIGATION
// ==========================================================

class _PortfolioNavigation extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _PortfolioNavigation({
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _PortfolioNavigationButton(
              label: '← SEBELUMNYA',
              enabled: currentPage > 0,
              onPressed: onPrevious,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _PortfolioNavigationButton(
              label: 'BERIKUTNYA →',
              enabled: currentPage < totalPages - 1,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================================
// NAVIGATION BUTTON
// ==========================================================

class _PortfolioNavigationButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  const _PortfolioNavigationButton({
    required this.label,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled ? AppColors.red : AppColors.panelBlue,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.ink,
              width: 3,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: enabled
                  ? Colors.white
                  : AppColors.ink.withValues(alpha: 0.4),
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// ABOUT SECTION
// ==========================================================

class _AboutSection extends StatelessWidget {
  const _AboutSection();

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

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const Text(
  'IKA\nWAHYUNINGTYAS',
  style: TextStyle(
    fontSize: 21,
    height: 0.95,
    fontWeight: FontWeight.w900,
    color: AppColors.ink,
  ),
),

const SizedBox(height: 8),

const Text(
  'NIM: E41251028',
  style: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.5,
    color: AppColors.red,
  ),
),

const SizedBox(height: 10),

const Text(
  'An Informatics Engineering student '
  'who loves technology, creativity, '
  'and turning ideas into digital experiences.',
  style: TextStyle(
    fontSize: 11,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  ),
),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        width: 82,
                        height: 105,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColors.paper,
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
                        child: ClipRect(
                          child: Image.asset(
                            'assets/images/ika1.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
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
            'Three.js',
            'Node-RED',
          ],
          color: AppColors.blue,
        ),

          const SizedBox(height: 18),

          const _ToolCard(
          title: 'HARDWARE',
          icon: Icons.memory,
          items: [
            'ESP32',
            'Sensor',
            'Relay',
            'Arduino',
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

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ==========================================================
// PROJECTS SECTION
// ==========================================================

class _ProjectsSection extends StatefulWidget {
  const _ProjectsSection({super.key});

  @override
  State<_ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<_ProjectsSection> {
  String _selectedTechnology = 'ALL TECHNOLOGIES';

  final PageController _pageController = PageController();

  final List<String> _technologies = [
    'ALL TECHNOLOGIES',
    'JavaScript',
    'PHP',
    'MySQL',
    'Flutter',
    'Dart',
    'IoT',
    'ESP32',
    'Three.js',
    'Node-RED',
    'Web Development',
    'Mobile Development',
  ];
  bool _matchesTechnology(List<String> technologies) {
    return _selectedTechnology == 'ALL TECHNOLOGIES' ||
        technologies.contains(_selectedTechnology);
  }

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

          const SizedBox(height: 22),

          // FILTER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.ink,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FILTER BY TECHNOLOGY',
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    border: Border.all(
                      color: AppColors.ink,
                      width: 3,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedTechnology,
                      isExpanded: true,
                      dropdownColor: AppColors.paper,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.ink,
                      ),
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                      items: _technologies.map((technology) {
                        return DropdownMenuItem<String>(
                          value: technology,
                          child: Text(
                            technology,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          _selectedTechnology = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

// =====================================================
// PROJECTS
// =====================================================

SizedBox(
  height: 430,
  child: PageView(
    controller: _pageController,
    children: [
  if (_matchesTechnology([
    'JavaScript',
    'PHP',
    'MySQL',
    'Web Development',
  ]))
    const _ProjectCard(
      number: '01',
      title: 'BENGKEL BUBUT',
      category: 'WEB QUEUE MANAGEMENT SYSTEM',
      description:
          'A web-based queue management system for a '
          'lathe workshop, developed to help manage '
          'customer queues and workshop services.',
      technologies: [
        'JavaScript',
        'PHP',
        'MySQL',
        'Web Development',
      ],
      color: AppColors.blue,
      icon: Icons.dns_rounded,
    ),

  if (_matchesTechnology([
    'Flutter',
    'Dart',
    'PHP',
    'MySQL',
    'Mobile Development',
  ]))
    const _ProjectCard(
      number: '02',
      title: 'CLOTHING RENTAL APP',
      category: 'MOBILE RENTAL APPLICATION',
      description:
          'A mobile application for a clothing rental '
          'business, developed to support the rental '
          'process and provide a simple user experience.',
      technologies: [
        'Flutter',
        'Dart',
        'PHP',
        'MySQL',
        'Mobile Development',
      ],
      color: AppColors.red,
      icon: Icons.checkroom_rounded,
    ),

  if (_matchesTechnology([
    'IoT',
    'ESP32',
    'Three.js',
    'Node-RED',
  ]))
    const _ProjectCard(
      number: '03',
      title: 'SMART CITY PROJECT',
      category: 'IOT & SMART CITY PROJECT',
      description:
          'A Smart City project developed during WFK '
          'with Korean students, exploring IoT-based '
          'technology and smart environmental solutions.',
      technologies: [
        'IoT',
        'ESP32',
        'Three.js',
        'Node-RED',
      ],
      color: AppColors.yellow,
      icon: Icons.location_city_rounded,
      imageAsset: 'assets/images/ika_hero.jpeg',
    ),

  if (_matchesTechnology([
    'Flutter',
    'Web Development',
    'Mobile Development',
  ]))
    const _ProjectCard(
      number: '04',
      title: 'COMING SOON',
      category: 'SMK PKL ATTENDANCE SYSTEM',
      description:
          'A mobile application and web system for '
          'managing student attendance during SMK '
          'internships (PKL). Currently in the planning '
          'and development stage.',
      technologies: [
        'Flutter',
        'Web Development',
        'Mobile Development',
      ],
      color: AppColors.panelBlue,
      icon: Icons.rocket_launch_rounded,
    ),
],
  ),
),
        ],
      ),
    );
  }
  @override
void dispose() {
  _pageController.dispose();
  super.dispose();
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
  final String? githubUrl;
  final String? imageAsset;

  const _ProjectCard({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.color,
    required this.icon,
    this.githubUrl,
    this.imageAsset,
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

                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectDetailScreen(
                      projectNumber: 'MISSION #$number',
                      title: title,
                      category: category,
                      description: description,
                      techStack: technologies,
                      githubUrl: githubUrl,
                      imageAsset: imageAsset,
                    ),
                    ),
                  );
                },
                child: Container(
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
// ORGANIZATION SECTION
// ==========================================================

class _OrganizationSection extends StatelessWidget {
  const _OrganizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        24,
        35,
        24,
        50,
      ),
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

          const _OrganizationCard(
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

          const _OrganizationCard(
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

          const _OrganizationCard(
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

// ==========================================================
// ORGANIZATION CARD
// ==========================================================

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
  final String? chapter;
  final String title;
  final String subtitle;

  const _ComicSectionTitle({
    this.chapter,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (chapter != null)
          Text(
            chapter!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),

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
    final Color textColor =
        lightText ? Colors.white : AppColors.ink;

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