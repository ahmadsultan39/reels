import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/constants.dart';

class ActionButton extends StatelessWidget {
  final String icon;
  final String? value;
  const ActionButton({super.key, this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(icon, width: 30.w),
        if (value != null)
        Text(
          value!,
          style: TextStyle(
            color: ColorsManager.white,
          ),
        ),
      ],
    );
  }
}
