import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appDarkMode,
      builder: (context, isDark, child) {
        final background =
            isDark ? const Color(0xFF171717) : AppColors.cream;
        final paper =
            isDark ? const Color(0xFF292929) : AppColors.paper;
        final panel =
            isDark ? const Color(0xFF303944) : AppColors.panelBlue;
        final ink =
            isDark ? Colors.white : AppColors.ink;

        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor:
                isDark ? const Color(0xFF242424) : AppColors.yellow,
            foregroundColor: ink,
            elevation: 0,
            title: const Text(
              'SETTINGS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: Container(
                height: 4,
                color: ink,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _SettingsPanel(
                background: paper,
                ink: ink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.palette_rounded,
                          size: 30,
                          color: AppColors.red,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'APPEARANCE',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: ink,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ink,
                      thickness: 2,
                      height: 28,
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: ink,
                        ),
                      ),
                      subtitle: Text(
                        isDark
                            ? 'Mode malam aktif'
                            : 'Mode terang aktif',
                        style: TextStyle(color: ink),
                      ),
                      secondary: Icon(
                        isDark
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                        color: AppColors.red,
                        size: 28,
                      ),
                      value: isDark,
                      activeTrackColor: AppColors.blue,
                      onChanged: (value) {
                        appDarkMode.value = value;
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ubah tampilan aplikasi antara mode terang '
                      'dan mode malam.',
                      style: TextStyle(
                        color: ink,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _SettingsPanel(
                background: panel,
                ink: ink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT THIS APP',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: ink,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'IKA.EXE PORTFOLIO',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Student Portfolio Application',
                      style: TextStyle(color: ink),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Flutter • MySQL API',
                      style: TextStyle(color: ink),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  final Color background;
  final Color ink;
  final Widget child;

  const _SettingsPanel({
    required this.background,
    required this.ink,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          color: ink,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: ink,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}