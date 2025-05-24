import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/features/reels/presentation/widgets/action_button.dart';
import 'package:reels/features/reels/presentation/widgets/follow_button.dart';
import 'package:reels/features/reels/presentation/widgets/user_picture.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/constants.dart';
import '../bloc/reels_bloc.dart';
import '../bloc/reels_state.dart';
import '../widgets/reel_widget.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onPageChanged(int index) {
    final reelsBloc = context.read<ReelsBloc>();
    if (index - 1 >= 0) {
      reelsBloc.state.videoControllers[index - 1].pause();
    }
    if (index + 1 < reelsBloc.state.reels.items.length) {
      reelsBloc.state.videoControllers[index + 1].pause();
    }
    reelsBloc.state.videoControllers[index].play();
    if (index >= reelsBloc.state.reels.items.length - 5 &&
        !reelsBloc.state.reels.isFinished) {
      reelsBloc.addGetReels();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state.isLoading && state.reels.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.reels.items.isEmpty) {
            return const Center(child: Text('No reels available'));
          }

          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: state.reels.items.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              if (index == _pageController.initialPage) {
                state.videoControllers[index].play();
              }
              return Stack(
                children: [
                  SizedBox(
                    height: 690.h,
                    width: 360.w,
                    child: ReelWidget(
                      reel: state.reels.items[index],
                      controller: state.videoControllers[index],
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.6],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              UserPicture(
                                url:
                                    state
                                        .reels
                                        .items[index]
                                        .user
                                        ?.profilePicture,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                state.reels.items[index].user?.username ?? "",
                                style: TextStyle(
                                  color: ColorsManager.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              FollowButton(
                                isFollow: state.reels.items[index].isFollow,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ActionButton(
                                icon: SvgAssets.like,
                                value:
                                    state.reels.items[index].totalLikes
                                        .toString(),
                              ),
                              SizedBox(height: 10.h),
                              ActionButton(
                                icon: SvgAssets.comment,
                                value:
                                    state.reels.items[index].totalComments
                                        .toString(),
                              ),
                              SizedBox(height: 10.h),
                              ActionButton(
                                icon: SvgAssets.save,
                                value:
                                    state.reels.items[index].totalWishlist
                                        .toString(),
                              ),
                              SizedBox(height: 10.h),
                              ActionButton(
                                icon: SvgAssets.view,
                                value:
                                    state.reels.items[index].totalViews
                                        .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
