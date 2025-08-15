import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/navigation_extention.dart';
import 'package:solar_app/widgets/load_image_item.dart';

Future<String> showLoadImageDialog(BuildContext context) async {
  String image = "";
  await showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          width: 300.w,
          height: 400.h,
          child: ListView(
            children: [
              Text("اختر صورة الحمل: ", style: AppTextStyles.font24BlackBold),
              SizedBox(height: 20.h),
              LoadImageItem(
                name: "غسالة",
                image: "assets/watching.jpg",
                callback: () {
                  image = "assets/watching.jpg";
                  context.pop();
                },
              ),
              LoadImageItem(
                name: "براد",
                image: "assets/ref.jpg",
                callback: () {
                  image = "assets/ref.jpg";
                  context.pop();
                },
              ),
              LoadImageItem(
                name: "مكنسة كهربائية",
                image: "assets/vaccum.jpg",
                callback: () {
                  image = "assets/vaccum.jpg";
                  context.pop();
                },
              ),
              LoadImageItem(
                name: "طباخ",
                image: "assets/cooker.jpg",
                callback: () {
                  image = "assets/cooker.jpg";
                  context.pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
  return image;
}
