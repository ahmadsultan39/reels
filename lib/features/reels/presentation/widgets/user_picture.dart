import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/constants.dart';

class UserPicture extends StatelessWidget {
  final String? url;

  const UserPicture({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.r,
      width: 30.r,
      padding: EdgeInsets.all(3).r,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorsManager.white),
      ),
      child:
          url != null && url!.isNotEmpty
              ? Image.network(url!)
              : Image.asset(ImageAssets.user),
    );
  }
}
