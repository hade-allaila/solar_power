import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/addload_provider.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int? _value;
  @override
  Widget build(BuildContext context) {
    return Consumer<AddloadProvider>(
      builder: (context, state, child) {
        if (state.avaliableLoadPins.isEmpty ||
            state.avaliableLoadPins == null) {
          return Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          );
        } else {
          var avaliablePins = state.avaliableLoadPins;
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: DropdownButton(
              value: _value,
              underline: Container(),
              items: [
                for (int i = 0; i < avaliablePins.length; i++)
                  DropdownMenuItem(
                    child: Text(avaliablePins[i]["name"] as String),
                    value: avaliablePins[i]["value"] as int,
                  ),
              ],
              hint: Text(AppLocalizations.of(context)!.loadPin),
              isExpanded: true,
              dropdownColor: Colors.white,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _value = value;
                  });
                  context.read<AddloadProvider>().loadPin = value;
                }
              },
            ),
          );
        }
      },
    );
  }
}
