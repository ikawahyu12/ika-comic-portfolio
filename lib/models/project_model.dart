class Project {
  final int id;
  final String title;
  final String description;
  final String category;
  final List<String> technologies;
  final String? image;
  final String? githubUrl;
  final String? createdAt;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.technologies,
    this.image,
    this.githubUrl,
    this.createdAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    final technologyText = (json['technologies'] ?? '').toString();

    return Project(
      id: int.parse(json['id'].toString()),
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      technologies: technologyText
          .split(',')
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList(),
      image: json['image']?.toString(),
      githubUrl: json['github_url']?.toString(),
      createdAt: json['created_at']?.toString(),
    );
  }
}