class Company {
  final String id;
  final String name;

  Company({required this.id, required this.name});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
