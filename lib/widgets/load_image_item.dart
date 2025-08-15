import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_app/theming/app_text_styles.dart';

class LoadImageItem extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback callback;
  const LoadImageItem({
    super.key,
    required this.name,
    required this.image,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Image.asset(image, width: 100, height: 80.h),
            Text(name, style: AppTextStyles.font16BlackBold),
          ],
        ),
      ),
    );
  }
}
