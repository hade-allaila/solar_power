import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/navigation_extention.dart';

void showCongfirmDialog(BuildContext context, var device, var callback) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: 300.w,
          height: 320.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Lottie.asset("assets/warning.json", repeat: false, height: 200),
              Text(
                AppLocalizations.of(context)!.confirmMsg,
                style: AppTextStyles.font16BlackBold,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      callback(device);
                      context.pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 30.h),
                      textStyle: AppTextStyles.font16WhiteBold,
                    ),
                    child: Text(AppLocalizations.of(context)!.ok),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      context.pop();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      minimumSize: Size(150, 40.h),
                      textStyle: AppTextStyles.font16WhiteBold,
                    ),
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
