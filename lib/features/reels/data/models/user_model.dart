import 'package:hive/hive.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends User {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String? profilePicture;

  @HiveField(3)
  final String? profilePictureCdn;

  @HiveField(4)
  final bool isFollow;

  const UserModel({
    required this.userId,
    required this.username,
    this.profilePicture,
    this.profilePictureCdn,
    required this.isFollow,
  }) : super(
         userId: userId,
         username: username,
         profilePicture: profilePicture,
         profilePictureCdn: profilePictureCdn,
         isFollow: isFollow,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      username: json['username'],
      profilePicture: json['profile_picture'],
      profilePictureCdn: json['profile_picture_cdn'],
      isFollow: json['is_follow'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'profile_picture': profilePicture,
      'profile_picture_cdn': profilePictureCdn,
      'is_follow': isFollow,
    };
  }
}
