import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'home_screen.dart';
import 'portfolio_screen.dart';
import 'contact_screen.dart';
import 'settings_screen.dart';

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
    return ValueListenableBuilder<bool>(
      valueListenable: appDarkMode,
      builder: (context, isDark, child) {
        final backgroundColor = isDark
            ? AppColors.darkBackground
            : AppColors.cream;

        return Scaffold(
          backgroundColor: backgroundColor,
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
              const SettingsScreen(),
            ],
          ),
          bottomNavigationBar: _ComicBottomNavigation(
            currentIndex: _currentIndex,
            onTap: _changePage,
            isDark: isDark,
          ),
        );
      },
    );
  }
}

class _ComicBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDark;

  const _ComicBottomNavigation({
    required this.currentIndex,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? AppColors.darkSurface : AppColors.paper;

    final borderColor = isDark ? const Color(0xFFFFF8E7) : AppColors.outline;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(top: BorderSide(color: borderColor, width: 4)),
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
                  isDark: isDark,
                ),
              ),
              Expanded(
                child: _BottomNavItem(
                  icon: Icons.auto_stories_rounded,
                  label: 'PORTFOLIO',
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: onTap,
                  isDark: isDark,
                ),
              ),
              Expanded(
                child: _BottomNavItem(
                  icon: Icons.mail_rounded,
                  label: 'CONTACT',
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: onTap,
                  isDark: isDark,
                ),
              ),
              Expanded(
                child: _BottomNavItem(
                  icon: Icons.settings_rounded,
                  label: 'SETTINGS',
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: onTap,
                  isDark: isDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDark;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == index;

    final Color backgroundColor = isActive
        ? AppColors.yellow
        : isDark
        ? AppColors.darkSurface
        : AppColors.paper;

    final Color foregroundColor = isActive
        ? AppColors.outline
        : isDark
        ? Colors.white
        : AppColors.outline;

    final Color borderColor = isDark
        ? const Color(0xFFFFF8E7)
        : AppColors.outline;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: index != 3
                  ? BorderSide(color: borderColor, width: 2)
                  : BorderSide.none,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 25, color: foregroundColor),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: foregroundColor,
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
