import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            // Background decoration
            const _ComicBackground(),

            // Main content
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ComicHeader(),

                  const SizedBox(height: 24),

                  const Text(
                    'WELCOME TO\nMY UNIVERSE!',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      height: 0.9,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'CHOOSE YOUR NEXT CHAPTER',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ABOUT
                  ComicMenuCard(
                    title: 'ABOUT ME',
                    subtitle: 'THE ORIGIN STORY',
                    icon: Icons.person,
                    color: AppColors.red,
                    rotation: -0.02,
                    onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AboutScreen(),
    ),
  );
},
                  ),

                  const SizedBox(height: 18),

                  // PROJECTS
                  ComicMenuCard(
                    title: 'PROJECTS',
                    subtitle: 'MISSION ARCHIVES',
                    icon: Icons.code,
                    color: AppColors.yellow,
                    rotation: 0.02,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Projects coming soon!'),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  // ORGANIZATION
                  ComicMenuCard(
                    title: 'ORGANIZATION',
                    subtitle: 'TEAM & ADVENTURES',
                    icon: Icons.groups,
                    color: AppColors.blue,
                    rotation: -0.015,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Organization coming soon!'),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Text(
                      'IKA.EXE • ISSUE #03 • 2026',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: AppColors.ink,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComicMenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final double rotation;
  final VoidCallback onTap;

  const ComicMenuCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.rotation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // Shadow
            Positioned(
              left: 7,
              top: 7,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  border: Border.all(
                    color: AppColors.ink,
                    width: 3,
                  ),
                ),
              ),
            ),

            // Card
            Container(
              height: 145,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: AppColors.ink,
                  width: 4,
                ),
              ),
              child: Row(
                children: [
                  // Icon box
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.cream,
                      border: Border.all(
                        color: AppColors.ink,
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 42,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(width: 18),

                  // Text
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: AppColors.ink,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: AppColors.ink,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'OPEN CHAPTER →',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: AppColors.ink,
                          ),
                        ),
                      ],
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

class _ComicHeader extends StatelessWidget {
  const _ComicHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: -0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),
            child: const Text(
              'IKA\nUNIVERSE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'THE DAILY CODE',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: AppColors.ink,
              ),
            ),
            Text(
              'ISSUE #03',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ComicBackground extends StatelessWidget {
  const _ComicBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            // Decorative circle
            Positioned(
              top: 130,
              right: -30,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow.withOpacity(0.25),
                ),
              ),
            ),

            // Bottom decoration
            Positioned(
              bottom: 100,
              left: -40,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red.withOpacity(0.15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}