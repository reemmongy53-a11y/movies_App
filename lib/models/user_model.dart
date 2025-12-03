class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatar;
  final List<int> watchList;
  final List<int> history;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    this.watchList = const [],
    this.history = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'watchList': watchList,
      'history': history,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? 'assets/images/avatar1.png',
      watchList: List<int>.from(json['watchList'] ?? []),
      history: List<int>.from(json['history'] ?? []),
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    List<int>? watchList,
    List<int>? history,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      watchList: watchList ?? this.watchList,
      history: history ?? this.history,
    );
  }
}