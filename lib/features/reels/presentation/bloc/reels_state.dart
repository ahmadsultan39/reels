import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../domain/entities/reel.dart';

part 'reels_state.g.dart';

sealed class ReelsState implements Built<ReelsState, ReelsStateBuilder> {
  bool get isLoading;

  PaginationStateData<Reel> get reels;
  BuiltList<VideoPlayerController> get videoControllers;

  ReelsState._();

  factory ReelsState([void Function(ReelsStateBuilder) updates]) = _$ReelsState;

  factory ReelsState.initial() => ReelsState(
    (b) =>
        b
          ..isLoading = false
          ..reels.replace(PaginationStateData<Reel>.initial())
          ..videoControllers.replace([]),
  );
}
