import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';

class FollowButton extends StatefulWidget {
  final bool isFollow;

  const FollowButton({super.key, required this.isFollow});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool isFollow = widget.isFollow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() {
        isFollow = !isFollow;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.white.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.all(Radius.circular(8)).r,
        ),
        child: Text(
          isFollow ? "Unfollow" : "Follow",
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
