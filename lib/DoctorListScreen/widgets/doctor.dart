class Doctor {
  final String name;
  final String specialization;
  final String imageUrl;

  Doctor({required this.name, required this.specialization, required this.imageUrl});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      imageUrl: json['imageUrl'],
    );
  }
}