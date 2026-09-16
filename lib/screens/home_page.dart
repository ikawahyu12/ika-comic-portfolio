import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final int _totalPages = 2;

  void _goToPage(int page) {
    if (page < 0 || page >= _totalPages) return;

    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
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
            // ======================================================
            // HEADER
            // ======================================================

            _HomeHeader(),

            // ======================================================
            // PAGE VIEW
            // ======================================================

            Expanded(
              child: PageView(
                controller: _pageController,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                children: const [
                  _ComicCoverPage(),
                  _ProfilePhotoPage(),
                ],
              ),
            ),

            // ======================================================
            // PAGE INDICATOR
            // ======================================================

            _PageIndicator(
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),

            // ======================================================
            // PREVIOUS / NEXT
            // ======================================================

            _PageNavigation(
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
// HOME HEADER
// ==========================================================

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

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
          // IKA LOGO
          Container(
            width: 44,
            height: 44,

            decoration: BoxDecoration(
              color: AppColors.red,

              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),

            alignment: Alignment.center,

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

          // TITLE
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'IKA.EXE',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink,
                ),
              ),

              Text(
                'PORTFOLIO UNIVERSE',
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
// PAGE 1 — COMIC COVER
// ==========================================================

class _ComicCoverPage extends StatelessWidget {
  const _ComicCoverPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),

      child: Column(
        children: [
          Text(
            'THE DAILY CODE',
            style: GoogleFonts.bangers(
              fontSize: 20,
              color: AppColors.ink,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'THE AMAZING',
            style: GoogleFonts.bangers(
              fontSize: 34,
              color: AppColors.ink,
              letterSpacing: 1,
            ),
          ),

          Text(
            'IKA.EXE',
            style: GoogleFonts.bangers(
              fontSize: 54,
              color: AppColors.red,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 20),

          // COMIC COVER PANEL
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(12),

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

            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),

                  color: AppColors.yellow,

                  child: const Text(
                    'A NEW DIGITAL HERO IS HERE!',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  'WELCOME TO',
                  style: GoogleFonts.bangers(
                    fontSize: 18,
                    color: AppColors.ink,
                  ),
                ),

                Text(
                  'IKA.EXE',
                  style: GoogleFonts.bangers(
                    fontSize: 46,
                    color: AppColors.red,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'INFORMATICS STUDENT\n'
                  'CREATIVE THINKER\n'
                  'FUTURE DEVELOPER',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 10,
                    height: 1.5,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: AppColors.ink,
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.blue,

                    border: Border.all(
                      color: AppColors.ink,
                      width: 3,
                    ),
                  ),

                  child: const Text(
                    'PORTFOLIO UNIVERSE',
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

          const SizedBox(height: 18),

          const Text(
            'SWIPE → TO MEET THE HERO',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// PAGE 2 — PROFILE PHOTO
// ==========================================================

class _ProfilePhotoPage extends StatelessWidget {
  const _ProfilePhotoPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),

      child: Column(
        children: [
          Text(
            'MEET THE HERO',
            style: GoogleFonts.bangers(
              fontSize: 28,
              color: AppColors.ink,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 14),

          // PHOTO
          Container(
            width: double.infinity,
            height: 330,

            decoration: BoxDecoration(
              color: AppColors.panelBlue,

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

            child: Image.asset(
            'assets/images/ika_hero.jpeg',
            fit: BoxFit.cover,
          ),
          ),

          const SizedBox(height: 20),

          // NAME
          Text(
            'IKA WAHYUNINGTYAS',
            textAlign: TextAlign.center,

            style: GoogleFonts.bangers(
              fontSize: 30,
              color: AppColors.red,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'INFORMATICS STUDENT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.ink,
            ),
          ),

          const SizedBox(height: 16),

          // MINI DESCRIPTION
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColors.yellow,

              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),

            child: const Text(
              'CREATIVE THINKER • '
              'PROBLEM SOLVER • '
              'FUTURE DEVELOPER',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 10,
                height: 1.5,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
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

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _PageIndicator({
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
          final isActive = index == currentPage;

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
// PREVIOUS / NEXT
// ==========================================================

class _PageNavigation extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _PageNavigation({
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
            child: _NavigationButton(
              label: '← SEBELUMNYA',
              enabled: currentPage > 0,
              onPressed: onPrevious,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _NavigationButton(
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

class _NavigationButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  const _NavigationButton({
    required this.label,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled
          ? AppColors.red
          : AppColors.panelBlue,

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