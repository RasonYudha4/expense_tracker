import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  const User({required this.id, this.email, this.name, this.photo});

  static const empty = User(id: '');

  factory User.fromFirestore(Map<String, dynamic> data, String id) {
    return User(
      id: id,
      email: data['email'],
      name: data['name'],
      photo: data['photo'],
    );
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? photo,
    double? height,
    double? weight,
    int? age,
    int? activityLevel,
    double? bmr,
    double? bmi,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photo,
      ];
}
