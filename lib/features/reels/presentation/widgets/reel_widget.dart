import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/core/widgets/app_loader.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../domain/entities/reel.dart';

class ReelWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final Reel reel;

  const ReelWidget({super.key, required this.controller, required this.reel});

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if ((widget.controller.value.isInitialized ||
              widget.controller.value.hasError) &&
          !isInitialized) {
        if (mounted) {
          setState(() {
            isInitialized = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.controller.value.isInitialized &&
        widget.controller.value.hasError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error loading this video"),
          SizedBox(height: 12.h),
          Icon(Icons.error, color: ColorsManager.error),
        ],
      );
    }
    if (widget.controller.value.isInitialized) {
      return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: widget.controller.value.size.width,
        height: widget.controller.value.size.height,
        child: Transform.rotate(
          angle: widget.reel.videoAspectRatio == "16:9" ? pi / 2 : 0,
          child: VideoPlayer(widget.controller),
        ),
      ),
    );
    }
    return AppLoader();
  }
}
