import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/colors_manager.dart';


void showToastMessage({
  required String message,
  required bool isError,
  bool isLong = false,
}) {
  debugPrint("Message is $message");
  if (message.isNotEmpty) {
    if (isError) {
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: ColorsManager.error,
        fontSize: 13.sp,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      /// if isn't error, display message with different background color
      Fluttertoast.showToast(
        msg: message,
        fontSize: 13.sp,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      );
    }
  }
}
