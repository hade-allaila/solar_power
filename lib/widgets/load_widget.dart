import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/theming/app_text_styles.dart';

class LoadWidget extends StatelessWidget {
  final LoadModel device;
  const LoadWidget({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(device.deviceName),
      onDismissed: (direction) {
        context.read<HomeProvider>().handelDeleteLoad(device.deviceName, context);
      },
      child: InkWell(
        onTap: () { 
          context.read<HomeProvider>().handleLoadTap(device);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(20), offset: Offset(0, 2)),
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
                        "Consuming:  ${device.operationPower}",
                        style: AppTextStyles.font10BlackNormal,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
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
