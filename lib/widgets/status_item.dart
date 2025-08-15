import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_app/theming/app_text_styles.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.unit,
  });
  final String title;
  final String unit;
  final String value;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: iconColor.withAlpha(20),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(icon, size: 40, color: iconColor),
          ),
          SizedBox(height: 10.h),
          Text(title, style: AppTextStyles.font16BlackBold),
          Text("$value $unit", style: AppTextStyles.font14BlackNormal),
        ],
      ),
    );
  }
}
