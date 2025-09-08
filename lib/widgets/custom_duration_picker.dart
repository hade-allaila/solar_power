import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/logic/addload_provider.dart';
import 'package:solar_app/utils/format_time.dart';

class CustomDurationPicker extends StatefulWidget {
  final String text;
  final Function handleDurationChange;
  const CustomDurationPicker({
    super.key,
    required this.text,
    required this.handleDurationChange,
  });

  @override
  State<CustomDurationPicker> createState() => _CustomDurationPickerState();
}

class _CustomDurationPickerState extends State<CustomDurationPicker> {
  Duration? d;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        label: Text(widget.text),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            widget.handleDurationChange(controller);
          },
          icon: Icon(Icons.date_range),
        ),
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
