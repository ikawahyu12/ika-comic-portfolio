import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/project_service.dart';
import '../theme/app_colors.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({super.key});
  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}
class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _technologiesController = TextEditingController();
  final _githubController = TextEditingController();
  final ProjectService _projectService = ProjectService();
  final ImagePicker _imagePicker = ImagePicker();
  String _selectedCategory = 'Mobile Development';
  XFile? _selectedImage;
  Uint8List? _selectedImageBytes;
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
    _githubController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1600,
        maxHeight: 1600,
      );

      if (pickedFile == null) {
        return;
      }

      final fileName = pickedFile.name.toLowerCase();
      final allowedExtensions = ['.jpg', '.jpeg', '.png', '.webp'];
      if (!allowedExtensions.any((ext) => fileName.endsWith(ext))) {
        throw Exception(
          'Format gambar tidak didukung. Gunakan JPG, PNG, atau WEBP.',
        );
      }

      final bytes = await pickedFile.readAsBytes();

      if (!mounted) return;
      setState(() {
        _selectedImage = pickedFile;
        _selectedImageBytes = bytes;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar
        (content: Text(e.toString().replaceFirst
        ('Exception: ', ''))),
      );
    }
  }

  void _removeSelectedImage() {
    setState(() {
      _selectedImage = null;
      _selectedImageBytes = null;
    });
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
        imageFile: _selectedImage,
        githubUrl: _githubController.text.trim().isEmpty
            ? null
            : _githubController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text
        ('Portfolio berhasil ditambahkan')),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst
        ('Exception: ', ''))),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Portfolio')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : AppColors.paper,
                border: Border.all(color: AppColors.darkOutline, width: 3),
                boxShadow: const [
                  BoxShadow(color: AppColors.darkOutline, offset: Offset(5, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Tambah Portfolio Baru',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Masukkan informasi karya atau project kamu.'),
                  const SizedBox(height: 24),

                  TextFormField(
                    controller: _titleController,
                    decoration: _inputDecoration('Judul Project', Icons.title),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
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
                      if (value == null || value.trim().isEmpty) {
                        return 'Deskripsi wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,
                    decoration: _inputDecoration('Kategori', Icons.category),
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
                    ).copyWith(hintText: 'Contoh: Flutter, Dart, MySQL'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Teknologi wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkPanel : AppColors.cream,
                      border: Border.all(
                        color: AppColors.darkOutline,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.image_outlined),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Gambar Karya',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            if (_selectedImage != null)
                              TextButton.icon(
                                onPressed: _removeSelectedImage,
                                icon: const Icon(Icons.delete_outline),
                                label: const Text('Hapus'),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (_selectedImageBytes != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _selectedImageBytes!,
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkSurface
                                  : AppColors.panelBlue,
                              border: Border.all(
                                color: AppColors.darkOutline,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 36,
                                    color: isDark
                                        ? AppColors.paper
                                        : AppColors.outline,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Belum ada gambar dipilih',
                                    style: TextStyle(
                                      color: isDark
                                          ? AppColors.paper
                                          : AppColors.outline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: _isLoading ? null : _pickImage,
                            icon: const Icon(Icons.upload_file),
                            label: Text(
                              _selectedImage == null
                                  ? 'Pilih Gambar'
                                  : 'Ganti Gambar',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _githubController,
                    keyboardType: TextInputType.url,
                    decoration: _inputDecoration(
                      'GitHub URL',
                      Icons.link,
                    ).copyWith(hintText: 'https://github.com/username/project'),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitProject,
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('SIMPAN PORTFOLIO'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
