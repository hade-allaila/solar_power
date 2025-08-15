import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/widgets/load_widget.dart';
import 'package:solar_app/widgets/system_status_consumer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, widget) {
        if (state.result == ApiResult.failer) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/connection.json",
                    width: 200.w,
                    height: 200.h,
                    repeat: false,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppLocalizations.of(context)!.connectionLost,
                    style: AppTextStyles.font24BlackBold,
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    controller: state.ipController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("IP Address"),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Icon(Icons.ad_units),
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
                    onSubmitted: (value) {
                      state.handleIpChange();
                    },
                  ),
                  SizedBox(height: 20.h),

                  TextButton(
                    onPressed: () {
                      state.handleIpChange();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.maxFinite, 50.h),
                      textStyle: AppTextStyles.font16WhiteBold,
                    ),
                    child: Text(AppLocalizations.of(context)!.reConnect),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppLocalizations.of(context)!.hello} Hade !",
                          style: AppTextStyles.font24BlackBold,
                        ),
                        Image.asset("assets/logo.png", width: 64),
                      ],
                    ),
                    // end header
                    SizedBox(height: 40.h),
                    // status
                    SystemStatusConsumer(),
                    // end status
                    SizedBox(height: 40.h),
                    Text(
                      AppLocalizations.of(context)!.loadlist,
                      style: AppTextStyles.font24BlackBold,
                    ),
                    SizedBox(height: 10.h),
                    // loads list
                    Consumer<HomeProvider>(
                      builder: (context, value, child) {
                        if (value.data != null) {
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.data!.devices.length,
                            itemBuilder: (context, index) {
                              return LoadWidget(
                                device: value.data!.devices[index],
                              );
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
