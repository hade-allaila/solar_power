import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: Colors.white,
          ),
          child: Lottie.asset("assets/loading.json", width: 50.w),
        ),
      );
    },
  );
}
