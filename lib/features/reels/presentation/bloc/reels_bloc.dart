import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/app_functions.dart';
import '../../domain/use_cases/get_reels_use_case.dart';
import 'reels_event.dart';
import 'reels_state.dart';

@injectable
class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final GetReelsUseCase _getReelsUseCase;

  void addGetReels() {
    add(GetReels());
  }

  @override
  Future<void> close() {
    for (final controller in state.videoControllers) {
      controller.dispose();
    }
    return super.close();
  }

  ReelsBloc(
    this._getReelsUseCase,
  ) : super(ReelsState.initial()) {
    on<GetReels>((event, emit) async {
      if (!state.reels.isFinished) {
        if (state.reels.currentPage == 0) {
          emit(state.rebuild((b) => b..isLoading = true));
        } else {
          emit(state.rebuild((b) => b..reels.isLoading = true));
        }

        final result = await _getReelsUseCase(state.reels.currentPage + 1);
        await result.fold(
          (failure) {
            showToastMessage(message: failure.error, isError: true);
            emit(state.rebuild((b) => b..isLoading = false));
          },
          (reels) async {
            List<VideoPlayerController> controllers = [];
            for (final reel in reels) {
              VideoPlayerController? controller;
              controller = VideoPlayerController.networkUrl(
                Uri.parse(reel.cdnUrl),
              );

              controller.initialize();
              controller.setLooping(true);
              controllers.add(controller);
            }

            emit(
              state.rebuild(
                (b) =>
                    b
                      ..isLoading = false
                      ..reels.currentPage = b.reels.currentPage! + 1
                      ..reels.items.addAll(reels)
                      ..videoControllers.addAll(controllers)
                      ..reels.isLoading = false
                      ..reels.isFinished = reels.isEmpty,
              ),
            );
          },
        );
      }
    }, transformer: droppable());
  }
}
