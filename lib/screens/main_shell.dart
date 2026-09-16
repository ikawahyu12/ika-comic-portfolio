import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'home_screen.dart';
import 'portfolio_screen.dart';
import 'contact_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,

      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            onEnterPortfolio: () {
              _changePage(1);
            },
          ),
          const PortfolioScreen(),
          const ContactScreen(),
        ],
      ),

      bottomNavigationBar: _ComicBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _changePage,
      ),
    );
  }
}

// =====================================================
// COMIC BOTTOM NAVIGATION
// =====================================================

class _ComicBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _ComicBottomNavigation({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border(
          top: BorderSide(
            color: AppColors.ink,
            width: 4,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: _BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'HOME',
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),

              Expanded(
                child: _BottomNavItem(
                  icon: Icons.auto_stories_rounded,
                  label: 'PORTFOLIO',
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),

              Expanded(
                child: _BottomNavItem(
                  icon: Icons.mail_rounded,
                  label: 'CONTACT',
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// BOTTOM NAV ITEM
// =====================================================

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == index;

    return Material(
      color: isActive
          ? AppColors.yellow
          : AppColors.paper,
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: index != 2
                  ? const BorderSide(
                      color: AppColors.ink,
                      width: 2,
                    )
                  : BorderSide.none,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: AppColors.ink,
              ),

              const SizedBox(height: 4),

              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: AppColors.ink,
                ),
              ),

              const SizedBox(height: 4),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isActive ? 22 : 0,
                height: 3,
                color: AppColors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}