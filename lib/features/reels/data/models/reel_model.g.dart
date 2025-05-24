// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReelModelAdapter extends TypeAdapter<ReelModel> {
  @override
  final int typeId = 0;

  @override
  ReelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReelModel(
      id: fields[0] as int,
      title: fields[1] as String,
      cdnUrl: fields[2] as String,
      totalViews: fields[3] as int,
      totalLikes: fields[4] as int,
      totalComments: fields[5] as int,
      totalShare: fields[6] as int,
      totalWishlist: fields[7] as int,
      duration: fields[8] as int,
      isHideComment: fields[9] as int,
      description: fields[10] as String?,
      user: fields[11] as UserModel?,
      isLiked: fields[12] as bool,
      isWished: fields[13] as bool,
      isFollow: fields[14] as bool,
      videoAspectRatio: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReelModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cdnUrl)
      ..writeByte(3)
      ..write(obj.totalViews)
      ..writeByte(4)
      ..write(obj.totalLikes)
      ..writeByte(5)
      ..write(obj.totalComments)
      ..writeByte(6)
      ..write(obj.totalShare)
      ..writeByte(7)
      ..write(obj.totalWishlist)
      ..writeByte(8)
      ..write(obj.duration)
      ..writeByte(9)
      ..write(obj.isHideComment)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.user)
      ..writeByte(12)
      ..write(obj.isLiked)
      ..writeByte(13)
      ..write(obj.isWished)
      ..writeByte(14)
      ..write(obj.isFollow)
      ..writeByte(15)
      ..write(obj.videoAspectRatio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
