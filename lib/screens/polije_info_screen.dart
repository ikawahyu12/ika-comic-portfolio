
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PolijeInfoScreen extends StatefulWidget {
  const PolijeInfoScreen({super.key});

  @override
  State<PolijeInfoScreen> createState() => _PolijeInfoScreenState();
}

class _PolijeInfoScreenState extends State<PolijeInfoScreen> {
  static const List<Map<String, String>> programs = [
    {
      'name': 'Teknik Informatika',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Mempelajari pengembangan perangkat lunak, pemrograman, '
          'basis data, dan teknologi komputasi. Cocok untuk mahasiswa '
          'yang tertarik membangun aplikasi dan solusi digital.',
    },
    {
      'name': 'Manajemen Informatika',
      'level': 'Diploma Tiga (D3)',
      'description':
          'Berfokus pada pemanfaatan teknologi informasi, aplikasi '
          'komputer, dan sistem informasi untuk mendukung kebutuhan organisasi.',
    },
    {
      'name': 'Teknologi Rekayasa Perangkat Lunak',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Berhubungan dengan perancangan, pembangunan, pengujian, '
          'dan pemeliharaan perangkat lunak.',
    },
    {
      'name': 'Teknologi Rekayasa Komputer',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Mempelajari teknologi komputer dan penerapannya dalam '
          'sistem komputasi serta perangkat terintegrasi.',
    },
    {
      'name': 'Bisnis Digital',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Menggabungkan pengetahuan bisnis dengan pemanfaatan '
          'teknologi digital.',
    },
    {
      'name': 'Bahasa Inggris',
      'level': 'Diploma Tiga (D3)',
      'description':
          'Mendukung pengembangan keterampilan bahasa Inggris '
          'untuk kebutuhan komunikasi dan dunia kerja.',
    },
    {
      'name': 'Produksi Media',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Berhubungan dengan produksi konten dan media kreatif.',
    },
    {
      'name': 'Teknik Energi Terbarukan',
      'level': 'Sarjana Terapan (D4)',
      'description':
          'Mempelajari teknologi dan penerapan sumber energi terbarukan.',
    },
  ];

  static const List<Map<String, dynamic>> facilities = [
    {
      'icon': Icons.science,
      'title': 'Laboratorium',
      'description':
          'Sarana praktikum dan pengembangan keterampilan sesuai bidang studi.',
      'color': AppColors.blue,
    },
    {
      'icon': Icons.local_library,
      'title': 'Perpustakaan',
      'description':
          'Sumber referensi untuk mendukung kegiatan belajar dan tugas.',
      'color': AppColors.yellow,
    },
    {
      'icon': Icons.local_hospital,
      'title': 'Klinik Kampus',
      'description':
          'Layanan kesehatan dasar bagi civitas akademika.',
      'color': AppColors.red,
    },
    {
      'icon': Icons.hotel,
      'title': 'Mini Hotel',
      'description':
          'Fasilitas praktik yang mendukung pembelajaran perhotelan dan pariwisata.',
      'color': AppColors.panelBlue,
    },
  ];

  static const List<Map<String, dynamic>> activities = [
    {
      'icon': Icons.groups,
      'title': 'Organisasi & UKM',
      'description':
          'Kembangkan kemampuan komunikasi, kepemimpinan, dan kerja sama.',
    },
    {
      'icon': Icons.emoji_events,
      'title': 'Prestasi Mahasiswa',
      'description':
          'Kesempatan mengembangkan dan menunjukkan kemampuan akademik maupun nonakademik.',
    },
    {
      'icon': Icons.lightbulb,
      'title': 'Proyek & Inovasi',
      'description':
          'Terapkan pengetahuan melalui proyek, kompetisi, dan kegiatan berbasis praktik.',
    },
    {
      'icon': Icons.handshake,
      'title': 'Kerja Sama Industri',
      'description':
          'Pendidikan vokasi mendukung kesiapan kerja melalui keterhubungan dengan dunia industri.',
    },
  ];

  String _selectedProgram = 'Teknik Informatika';

  Map<String, String> get _currentProgram =>
      programs.firstWhere(
        (program) => program['name'] == _selectedProgram,
      );

  Future<void> _openWebsite(String url) async {
    final uri = Uri.parse(url);

    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );

      if (!opened && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Website tidak dapat dibuka.'),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi kesalahan saat membuka website.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cream,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 32, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _chapterLabel('CHAPTER 04'),
            const SizedBox(height: 16),

            const Text(
              'POLIJE\nINFO!',
              style: TextStyle(
                fontSize: 46,
                height: 0.9,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              'EXPLORE THE CAMPUS, DISCOVER YOUR FUTURE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.8,
                color: AppColors.red,
              ),
            ),
            const SizedBox(height: 24),

            _shadowPanel(
              color: AppColors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.school_rounded,
                    size: 42,
                    color: AppColors.ink,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'POLITEKNIK NEGERI JEMBER',
                    style: TextStyle(
                      fontSize: 23,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Perguruan tinggi vokasi negeri di Jawa Timur '
                    'yang menyelenggarakan pendidikan Diploma Tiga, '
                    'Sarjana Terapan, dan Magister Terapan. '
                    'Pendidikan vokasi menekankan keterampilan terapan '
                    'dan kesiapan menghadapi dunia kerja.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _InfoLine(
                    icon: Icons.location_on,
                    text: 'Jl. Mastrip, Jember, Jawa Timur',
                  ),
                  const SizedBox(height: 8),
                  const _InfoLine(
                    icon: Icons.phone,
                    text: '(0331) 333533',
                  ),
                  const SizedBox(height: 18),
                  _websiteButton(
                    label: 'WEBSITE RESMI POLIJE',
                    url: 'https://polije.ac.id/',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),
            const _SectionHeading(
              title: 'EXPLORE PROGRAMS',
              subtitle: 'PILIH PROGRAM STUDI UNTUK DIJELAJAHI',
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.paper,
                border: Border.all(
                  color: AppColors.ink,
                  width: 3,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedProgram,
                  isExpanded: true,
                  dropdownColor: AppColors.paper,
                  items: programs.map((program) {
                    return DropdownMenuItem<String>(
                      value: program['name'],
                      child: Text(
                        program['name']!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _selectedProgram = value);
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),
            _shadowPanel(
              color: AppColors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    color: AppColors.red,
                    child: const Text(
                      'PROGRAM PROFILE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _currentProgram['name']!,
                    style: const TextStyle(
                      fontSize: 22,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    _currentProgram['level']!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _currentProgram['description']!,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.6,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _websiteButton(
                    label: 'LIHAT PROGRAM STUDI RESMI',
                    url: 'https://polije.ac.id/program-studi/',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),
            const _SectionHeading(
              title: 'MY STUDY PROGRAM',
              subtitle: 'TEKNOLOGI INFORMASI',
            ),
            const SizedBox(height: 16),

            _shadowPanel(
              color: AppColors.paper,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.computer,
                    size: 40,
                    color: AppColors.red,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'D4 TEKNIK INFORMATIKA',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bidang yang berkaitan dengan pengembangan aplikasi, '
                    'pemrograman, basis data, dan pemecahan masalah '
                    'menggunakan teknologi. Proyek portofolio ini menjadi '
                    'salah satu latihan untuk mengembangkan keterampilan '
                    'Flutter, REST API, dan MySQL.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.6,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _Tag('PROGRAMMING'),
                      _Tag('DATABASE'),
                      _Tag('MOBILE & WEB'),
                      _Tag('SOFTWARE'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _websiteButton(
                    label: 'SUMBER INFORMASI AKADEMIK',
                    url: 'https://polije.ac.id/program-studi/',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),
            const _SectionHeading(
              title: 'CAMPUS FACILITIES',
              subtitle: 'SARANA PENDUKUNG PEMBELAJARAN',
            ),
            const SizedBox(height: 16),

            ...facilities.map((facility) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _FeatureCard(
                  icon: facility['icon'] as IconData,
                  title: facility['title'] as String,
                  description: facility['description'] as String,
                  color: facility['color'] as Color,
                ),
              );
            }),

            _websiteButton(
              label: 'DETAIL FASILITAS KAMPUS',
              url: 'https://kui.polije.ac.id/student-service/campus-facilities',
            ),

            const SizedBox(height: 36),
            const _SectionHeading(
              title: 'STUDENT LIFE',
              subtitle: 'TUMBUH, BERKARYA, DAN BERKOLABORASI',
            ),
            const SizedBox(height: 16),

            ...activities.map((activity) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _FeatureCard(
                  icon: activity['icon'] as IconData,
                  title: activity['title'] as String,
                  description: activity['description'] as String,
                  color: AppColors.cream,
                ),
              );
            }),

            _websiteButton(
              label: 'PORTAL KEMAHASISWAAN',
              url: 'https://kemahasiswaan.polije.ac.id/',
            ),

            const SizedBox(height: 36),
            _shadowPanel(
              color: AppColors.ink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'READY FOR YOUR NEXT MISSION?',
                    style: TextStyle(
                      fontSize: 23,
                      height: 1.15,
                      fontWeight: FontWeight.w900,
                      color: AppColors.yellow,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Jelajahi program studi, kegiatan mahasiswa, '
                    'dan informasi resmi kampus melalui portal POLIJE.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.6,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _websiteButton(
                    label: 'KUNJUNGI POLIJE.AC.ID',
                    url: 'https://polije.ac.id/',
                    inverted: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Center(
              child: Text(
                'INFORMATION SOURCES: OFFICIAL POLIJE WEBSITES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chapterLabel(String label) {
    return Transform.rotate(
      angle: -0.02,
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
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            color: AppColors.ink,
          ),
        ),
      ),
    );
  }

  Widget _shadowPanel({
    required Color color,
    required Widget child,
  }) {
    return Stack(
      children: [
        Positioned(
          left: 6,
          top: 6,
          right: 0,
          bottom: 0,
          child: Container(color: AppColors.ink),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: AppColors.ink,
              width: 3,
            ),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _websiteButton({
    required String label,
    required String url,
    bool inverted = false,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _openWebsite(url),
        icon: Icon(
          Icons.open_in_new,
          size: 16,
          color: inverted ? AppColors.ink : Colors.white,
        ),
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: inverted ? AppColors.ink : Colors.white,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: inverted ? AppColors.yellow : AppColors.red,
          side: const BorderSide(
            color: AppColors.ink,
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 13,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeading({
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
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 120,
          height: 4,
          color: AppColors.red,
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoLine({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.ink),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
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
        label,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          color: AppColors.ink,
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.paper,
              border: Border.all(
                color: AppColors.ink,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 26,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: AppColors.ink,
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