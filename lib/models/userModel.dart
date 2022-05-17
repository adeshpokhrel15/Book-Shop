class User {
  late String email;
  late String userName;
  late String uId;

  User({required this.email, required this.userName, required this.uId});

  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json["email"], userName: json["userName"], uId: json["userId"]);
}
