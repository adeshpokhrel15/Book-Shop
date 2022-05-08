class User {
  late String email;
  late String userName;

  User({required this.email, required this.userName});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json["email"], userName: json["userName"]);
}
