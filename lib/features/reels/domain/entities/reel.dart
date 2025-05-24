import 'package:equatable/equatable.dart';

import 'user.dart';

class Reel extends Equatable {
  final int id;
  final String title;
  final String cdnUrl;
  final int totalViews;
  final int totalLikes;
  final int totalComments;
  final int totalShare;
  final int totalWishlist;
  final int duration;
  final int isHideComment;
  final String? description;
  final User? user;
  final bool isLiked;
  final bool isWished;
  final bool isFollow;
  final String videoAspectRatio;

  const Reel({
    required this.id,
    required this.title,
    required this.cdnUrl,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.isHideComment,
    this.description,
    this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    required this.videoAspectRatio,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    cdnUrl,
    totalViews,
    totalLikes,
    totalComments,
    totalShare,
    totalWishlist,
    duration,
    isHideComment,
    description,
    user,
    isLiked,
    isWished,
    isFollow,
  ];
}
