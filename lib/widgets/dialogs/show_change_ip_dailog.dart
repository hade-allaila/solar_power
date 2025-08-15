import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/navigation_extention.dart';

void showChangeIpDialog(BuildContext context) { 
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Lottie.asset("assets/success.json", repeat: false, height: 200),
              Text(
                AppLocalizations.of(context)!.loadAdded,
                style: AppTextStyles.font24BlackBold,
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