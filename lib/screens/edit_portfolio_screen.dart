import 'package:flutter/material.dart';

import '../models/project_model.dart';
import '../services/project_service.dart';

class EditPortfolioScreen extends StatefulWidget {
  final Project project;

  const EditPortfolioScreen({
    super.key,
    required this.project,
  });

  @override
  State<EditPortfolioScreen> createState() =>
      _EditPortfolioScreenState();
}

class _EditPortfolioScreenState
    extends State<EditPortfolioScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _technologiesController;
  late final TextEditingController _imageController;
  late final TextEditingController _githubController;

  final ProjectService _projectService = ProjectService();

  late String _selectedCategory;

  bool _isLoading = false;

  final List<String> _categories = [
    'Mobile Development',
    'Web Development',
    'UI/UX Design',
    'IoT',
    'Other',
  ];

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.project.title,
    );

    _descriptionController = TextEditingController(
      text: widget.project.description,
    );

    _technologiesController = TextEditingController(
      text: widget.project.technologies.join(', '),
    );

    _imageController = TextEditingController(
      text: widget.project.image ?? '',
    );

    _githubController = TextEditingController(
      text: widget.project.githubUrl ?? '',
    );

    _selectedCategory = _categories.contains(
      widget.project.category,
    )
        ? widget.project.category
        : 'Other';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _technologiesController.dispose();
    _imageController.dispose();
    _githubController.dispose();

    super.dispose();
  }

  Future<void> _updateProject() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _projectService.updateProject(
        id: widget.project.id,
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
            'Portfolio berhasil diperbarui',
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
        title: const Text('Edit Portfolio'),
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
                  'Edit Portfolio',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Ubah informasi project yang dipilih.',
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
                  initialValue: _selectedCategory,
                  decoration: _inputDecoration(
                    'Kategori',
                    Icons.category,
                  ),
                  items: _categories.map((category) {
                    return DropdownMenuItem<String>(
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
                  ).copyWith(
                    hintText:
                        'Contoh: Flutter, Dart, MySQL',
                  ),
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
                  ).copyWith(
                    hintText:
                        'Contoh: assets/images/project.png',
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _githubController,
                  keyboardType: TextInputType.url,
                  decoration: _inputDecoration(
                    'GitHub URL',
                    Icons.link,
                  ).copyWith(
                    hintText:
                        'https://github.com/username/project',
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed:
                        _isLoading
                            ? null
                            : _updateProject,
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
                            'SIMPAN PERUBAHAN',
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