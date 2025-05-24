import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String username;
  final String? profilePicture;
  final String? profilePictureCdn;
  final bool isFollow;

  const User({
    required this.userId,
    required this.username,
    this.profilePicture,
    this.profilePictureCdn,
    required this.isFollow,
  });

  @override
  List<Object?> get props => [
    userId,
    username,
    profilePicture,
    profilePictureCdn,
    isFollow,
  ];
}
