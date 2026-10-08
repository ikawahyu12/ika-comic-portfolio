import 'package:flutter/material.dart';

import '../services/project_service.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({super.key});

  @override
  State<AddPortfolioScreen> createState() =>
      _AddPortfolioScreenState();
}

class _AddPortfolioScreenState
    extends State<AddPortfolioScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _technologiesController = TextEditingController();
  final _imageController = TextEditingController();
  final _githubController = TextEditingController();

  final ProjectService _projectService = ProjectService();

  String _selectedCategory = 'Mobile Development';

  bool _isLoading = false;

  final List<String> _categories = [
    'Mobile Development',
    'Web Development',
    'UI/UX Design',
    'IoT',
    'Other',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _technologiesController.dispose();
    _imageController.dispose();
    _githubController.dispose();

    super.dispose();
  }

  Future<void> _submitProject() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _projectService.createProject(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory,
        technologies: _technologiesController.text.trim(),
        image: _imageController.text.trim().isEmpty
            ? null
            : _imageController.text.trim(),
        githubUrl: _githubController.text.trim().isEmpty
            ? null
            : _githubController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Portfolio berhasil ditambahkan',
          ),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceFirst(
              'Exception: ',
              '',
            ),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  InputDecoration _inputDecoration(
    String label,
    IconData icon,
  ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Portfolio'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Tambah Portfolio Baru',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Masukkan informasi karya atau project kamu.',
                ),

                const SizedBox(height: 24),

                TextFormField(
                  controller: _titleController,
                  decoration: _inputDecoration(
                    'Judul Project',
                    Icons.title,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Judul project wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: _inputDecoration(
                    'Deskripsi',
                    Icons.description,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Deskripsi wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: _inputDecoration(
                    'Kategori',
                    Icons.category,
                  ),
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _technologiesController,
                  decoration: _inputDecoration(
                    'Teknologi',
                    Icons.code,
                  ),
                  hintText:
                      'Contoh: Flutter, Dart, MySQL',
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Teknologi wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _imageController,
                  decoration: _inputDecoration(
                    'Path Gambar',
                    Icons.image,
                  ),
                  hintText:
                      'Contoh: assets/images/project.png',
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _githubController,
                  keyboardType:
                      TextInputType.url,
                  decoration: _inputDecoration(
                    'GitHub URL',
                    Icons.link,
                  ),
                  hintText:
                      'https://github.com/username/project',
                ),

                const SizedBox(height: 28),

                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed:
                        _isLoading ? null : _submitProject,
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'SIMPAN PORTFOLIO',
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}