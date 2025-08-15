import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/navigation_extention.dart';

showNotConnectedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: 300.w,
          height: 340.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Lottie.asset(
                "assets/error.json",
                repeat: false,
                height: 200,
                width: 200,
              ),
              Text(
                AppLocalizations.of(context)!.notConnected,
                style: AppTextStyles.font16BlackBold,
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () async {
                  context.pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.maxFinite, 50.h),
                  textStyle: AppTextStyles.font16WhiteBold,
                ),
                child: Text(AppLocalizations.of(context)!.ok),
              ),
            ],
          ),
        ),
      );
    },
  );
}
