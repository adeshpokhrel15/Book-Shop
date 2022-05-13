import 'package:hive/hive.dart';
part 'users.g.dart';


@HiveType(typeId: 0)
class User extends HiveObject{

  @HiveField(0)
  late String email;

  @HiveField(1)
  late String token;

  @HiveField(2)
  late String fullName;


User({
    required this.email,
  required this.token,
  required this.fullName,
});


  factory User.fromJson(Map<String, dynamic> json){
     return User(
         email: json['email'],
         token: json['token'],
         fullName: json['username']
     );

  }


}