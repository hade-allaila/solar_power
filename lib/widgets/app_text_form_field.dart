import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_app/l10n/app_localizations.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.name,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  });
  final String name;
  final TextEditingController controller;
  final bool isNumber;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.emptyFeildError;
        }
        return null;
      },
      keyboardType: isNumber ? TextInputType.number : null,
      decoration: InputDecoration(
        label: Text(name),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(icon),
        fillColor: Colors.grey.shade200,
        focusColor: Colors.red,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
