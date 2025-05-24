import 'package:built_value/built_value.dart';

part 'reels_event.g.dart';

sealed class ReelsEvent {}

abstract class GetReels extends ReelsEvent
    implements Built<GetReels, GetReelsBuilder> {

  GetReels._();

  factory GetReels([void Function(GetReelsBuilder) updates]) = _$GetReels;
}
