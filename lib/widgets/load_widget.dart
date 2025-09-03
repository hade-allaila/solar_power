import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/navigation_extention.dart';
import 'package:solar_app/widgets/dialogs/show_confirm_dailog.dart';

class LoadWidget extends StatelessWidget {
  final LoadModel device;
  const LoadWidget({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(device.deviceName),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          context.read<HomeProvider>().handelDeleteLoad(
            device.deviceName,
            context,
            device.pin
          );
        }
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.redAccent,
        ),
        child: Row(
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 5.w),
            Text(
              AppLocalizations.of(context)!.delete,
              style: AppTextStyles.font16WhiteBold,
            ),
          ],
        ),
      ),
      // secondaryBackground: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(16.r),
      //     color: Colors.blue,
      //   ),
      //   padding: EdgeInsets.only(right: 20.w),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       Icon(Icons.edit, color: Colors.white),
      //       SizedBox(width: 5.w),
      //       Text("Edit", style: AppTextStyles.font16WhiteBold),
      //     ],
      //   ),
      // ),
      child: InkWell(
        onTap: () {
          print(
            "------------------------- Load Has been pressed ----------------------------",
          );
          showCongfirmDialog(
            context,
            device,
            context.read<HomeProvider>().handleLoadTap,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black.withAlpha(20),
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                device.image != null && device.image!.isNotEmpty
                    ? device.image!
                    : "assets/watching.jpg",
                height: 70,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      device.deviceName,
                      style: AppTextStyles.font16BlackBold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.electrical_services_outlined),
                      SizedBox(width: 5.w),
                      Text(
                        "${AppLocalizations.of(context)!.consuming}:  ${device.operationPower}",
                        style: AppTextStyles.font10BlackNormal,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.online_prediction_sharp),
                      SizedBox(width: 5.w),
                      Text(
                        "${AppLocalizations.of(context)!.state}: ",
                        style: AppTextStyles.font10BlackNormal,
                      ),
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          color: device.loadState == LoadState.forcedOn
                              ? Colors.blue.shade100
                              : device.loadState == LoadState.forcedOff
                              ? Colors.red.shade100
                              : Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            device.loadState == LoadState.forcedOn
                                ? AppLocalizations.of(context)!.forcedOn
                                : device.loadState == LoadState.forcedOff
                                ? AppLocalizations.of(context)!.forcedOff
                                : AppLocalizations.of(context)!.auto,
                            style: TextStyle(fontSize: 8.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(flex: 2),
              SizedBox(
                width: 20,
                height: 20,
                child: Switch(
                  value: device.state == 'ON' ? true : false,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red.withAlpha(20),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
