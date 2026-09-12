import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Stack(
          children: [
            const _ComicBackground(),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),

                  const SizedBox(height: 35),

                  _buildHeroTitle(),

                  const SizedBox(height: 15),

                  const Text(
                    'HAVE A MISSION, IDEA, OR COLLABORATION? '
                    'SEND ME A SIGNAL!',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 30),

                  _buildSignalCard(),

                  const SizedBox(height: 30),

                  Text(
                    'TRANSMISSION CHANNELS',
                    style: GoogleFonts.bangers(
                      fontSize: 28,
                      color: AppColors.ink,
                    ),
                  ),

                  const SizedBox(height: 18),

                  ContactCard(
                    icon: Icons.email,
                    title: 'EMAIL',
                    subtitle: 'your.email@gmail.com',
                    color: AppColors.red,
                    onTap: () {
                      _showMessage(context, 'Email selected!');
                    },
                  ),

                  const SizedBox(height: 20),

                  ContactCard(
                    icon: Icons.code,
                    title: 'GITHUB',
                    subtitle: 'github.com/ikawahyu12',
                    color: AppColors.ink,
                    darkText: true,
                    onTap: () {
                      _showMessage(context, 'GitHub selected!');
                    },
                  ),

                  const SizedBox(height: 20),

                  ContactCard(
                    icon: Icons.cloud,
                    title: 'GITLAB',
                    subtitle: 'gitlab.com/ikatyas327',
                    color: AppColors.panelBlue,
                    darkText: true,
                    onTap: () {
                      _showMessage(context, 'GitLab selected!');
                    },
                  ),

                  const SizedBox(height: 20),

                  ContactCard(
                    icon: Icons.business_center,
                    title: 'LINKEDIN',
                    subtitle: 'linkedin.com/in/your-profile',
                    color: AppColors.yellow,
                    onTap: () {
                      _showMessage(context, 'LinkedIn selected!');
                    },
                  ),

                  const SizedBox(height: 35),

                  _buildFinalMessage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              border: Border.all(
                color: AppColors.ink,
                width: 3,
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.ink,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'THE DAILY CODE',
                style: GoogleFonts.bangers(
                  fontSize: 21,
                ),
              ),
              const Text(
                'COMMUNICATION CENTER',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        Transform.rotate(
          angle: 0.08,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: AppColors.red,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: const Text(
              'ONLINE',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w900,
                color: AppColors.paper,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroTitle() {
    return Transform.rotate(
      angle: -0.03,
      child: Text(
        'CALL THE\nHERO!',
        style: GoogleFonts.bangers(
          fontSize: 58,
          height: 0.78,
          color: AppColors.red,
          shadows: const [
            Shadow(
              offset: Offset(4, 4),
              color: AppColors.ink,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignalCard() {
    return Transform.rotate(
      angle: 0.01,
      child: Stack(
        children: [
          Positioned.fill(
            left: 7,
            top: 7,
            child: Container(
              color: AppColors.ink,
            ),
          ),

          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.panelBlue,
              border: Border.all(
                color: AppColors.ink,
                width: 4,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.wifi_tethering,
                    size: 90,
                    color: AppColors.paper,
                  ),
                ),

                Positioned(
                  top: 15,
                  left: 15,
                  child: _Label(
                    text: 'SIGNAL DETECTED!',
                    color: AppColors.yellow,
                  ),
                ),

                Positioned(
                  bottom: 15,
                  right: 15,
                  child: _Label(
                    text: 'READY TO CONNECT',
                    color: AppColors.red,
                    textColor: AppColors.paper,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinalMessage() {
    return Transform.rotate(
      angle: -0.02,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.red,
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
          children: [
            Text(
              "LET'S CREATE\nSOMETHING AWESOME!",
              textAlign: TextAlign.center,
              style: GoogleFonts.bangers(
                fontSize: 31,
                height: 0.85,
                color: AppColors.paper,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Every great project starts with an idea.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.paper,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}


// =====================================================
// CONTACT CARD
// =====================================================

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final bool darkText;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
    this.darkText = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        darkText ? AppColors.paper : AppColors.ink;

    return Transform.rotate(
      angle: title == 'GITHUB' ? -0.012 : 0.012,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              left: 6,
              top: 6,
              child: Container(
                color: AppColors.ink,
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: AppColors.ink,
                  width: 4,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.paper,
                      border: Border.all(
                        color: AppColors.ink,
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 28,
                      color: AppColors.ink,
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
                            fontSize: 25,
                            color: textColor,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward,
                    color: textColor,
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


// =====================================================
// COMIC LABEL
// =====================================================

class _Label extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _Label({
    required this.text,
    required this.color,
    this.textColor = AppColors.ink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.ink,
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
      ),
    );
  }
}


// =====================================================
// BACKGROUND
// =====================================================

class _ComicBackground extends StatelessWidget {
  const _ComicBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 180,
            right: -70,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellow.withOpacity(0.12),
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            left: -70,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red.withOpacity(0.10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}