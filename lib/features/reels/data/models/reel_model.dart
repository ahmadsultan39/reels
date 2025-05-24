import 'package:hive/hive.dart';
import 'package:reels/features/reels/domain/entities/reel.dart';

import 'user_model.dart';

part 'reel_model.g.dart';

@HiveType(typeId: 0)
class ReelModel extends Reel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String cdnUrl;

  @HiveField(3)
  final int totalViews;

  @HiveField(4)
  final int totalLikes;

  @HiveField(5)
  final int totalComments;

  @HiveField(6)
  final int totalShare;

  @HiveField(7)
  final int totalWishlist;

  @HiveField(8)
  final int duration;

  @HiveField(9)
  final int isHideComment;

  @HiveField(10)
  final String? description;

  @HiveField(11)
  final UserModel? user;

  @HiveField(12)
  final bool isLiked;

  @HiveField(13)
  final bool isWished;

  @HiveField(14)
  final bool isFollow;

  @HiveField(15)
  final String videoAspectRatio;

  const ReelModel({
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
  }) : super(
         id: id,
         title: title,
         cdnUrl: cdnUrl,
         totalViews: totalViews,
         totalLikes: totalLikes,
         totalComments: totalComments,
         totalShare: totalShare,
         totalWishlist: totalWishlist,
         duration: duration,
         isHideComment: isHideComment,
         description: description,
         user: user,
         isLiked: isLiked,
         isWished: isWished,
         isFollow: isFollow,
         videoAspectRatio: videoAspectRatio,
       );

  factory ReelModel.fromJson(Map<String, dynamic> json) {
    return ReelModel(
      id: json['id'],
      title: json['title'],
      cdnUrl: json['cdn_url'],
      totalViews: json['total_views'],
      totalLikes: json['total_likes'],
      totalComments: json['total_comments'],
      totalShare: json['total_share'],
      totalWishlist: json['total_wishlist'],
      duration: json['duration'],
      isHideComment: json['is_hide_comment'],
      description: json['description'],
      user: json['user'] != null ? UserModel.fromJson(Map<String,dynamic>.from(json['user'])) : null,
      isLiked: json['is_liked'],
      isWished: json['is_wished'],
      isFollow: json['is_follow'],
      videoAspectRatio: json['video_aspect_ratio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'cdn_url': cdnUrl,
      'total_views': totalViews,
      'total_likes': totalLikes,
      'total_comments': totalComments,
      'total_share': totalShare,
      'total_wishlist': totalWishlist,
      'duration': duration,
      'is_hide_comment': isHideComment,
      'description': description,
      'user': user?.toJson(),
      'is_liked': isLiked,
      'is_wished': isWished,
      'is_follow': isFollow,
      'video_aspect_ratio' : videoAspectRatio,
    };
  }
}
