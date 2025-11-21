class AuthModel {
  String? name;
  String email;
  String password;
  String? confirmPassword;
  String? phoneNumber;
  String? avatar;

  AuthModel({
    this.name,
    required this.email,
    required this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.avatar,
  });
}