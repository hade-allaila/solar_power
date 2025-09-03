import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/addload_provider.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/avaliable_loadpins_database_helper.dart';
import 'package:solar_app/widgets/app_text_form_field.dart';
import 'package:solar_app/widgets/custom_drop_down.dart';
import 'package:solar_app/widgets/custom_load_image.dart';
import 'package:solar_app/widgets/custom_duration_picker.dart';

class AddLoadScreen extends StatelessWidget {
  const AddLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.addLoad,
          style: AppTextStyles.font24BlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AddloadProvider>(
          builder: (context, state, widget) {
            return AddLoadForm();
          },
        ),
      ),
    );
  }
}

class AddLoadForm extends StatelessWidget {
  const AddLoadForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Customloadimage(),
            Form(
              key: context.read<AddloadProvider>().formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    controller: context.read<AddloadProvider>().loadName,
                    name: AppLocalizations.of(context)!.loadName,
                    icon: Icons.near_me,
                  ),
                  SizedBox(height: 20.h),

                  AppTextFormField(
                    controller: context.read<AddloadProvider>().loadPriority,
                    name: AppLocalizations.of(context)!.loadPriority,
                    icon: Icons.priority_high,
                    isNumber: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomDropDown(),
                  SizedBox(height: 20.h),

                  AppTextFormField(
                    controller: context.read<AddloadProvider>().loadPower,
                    name: AppLocalizations.of(context)!.loadPower,
                    icon: Icons.power_settings_new_outlined,
                    isNumber: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomDurationPicker(
                    handleDurationChange: () async {
                      Duration? duration = await showDurationPicker(
                        context: context,
                        initialTime: Duration(
                          minutes:
                              AppLocalizations.of(context)!.minOnTime.isNotEmpty
                              ? int.parse(
                                  AppLocalizations.of(context)!.minOnTime,
                                )
                              : 30,
                        ),
                      );
                      if (duration != null) {
                        context.read<AddloadProvider>().minOnTime = duration
                            .inMilliseconds
                            .toString();
                      }
                    },
                    text: AppLocalizations.of(context)!.minOnTime,
                  ),
                  SizedBox(height: 20.h),
                  CustomDurationPicker(
                    handleDurationChange: () async {
                      Duration? duration = await showDurationPicker(
                        context: context,
                        initialTime: Duration(
                          minutes:
                              AppLocalizations.of(context)!.maxOnTime.isNotEmpty
                              ? int.parse(
                                  AppLocalizations.of(context)!.maxOnTime,
                                )
                              : 30,
                        ),
                      );
                      if (duration != null) {
                        context.read<AddloadProvider>().maxOnTime = duration
                            .inMilliseconds
                            .toString();
                      }
                    },
                    text: AppLocalizations.of(context)!.maxOnTime,
                  ),
                  SizedBox(height: 20.h),
                  CustomDurationPicker(
                    handleDurationChange: () async {
                      Duration? duration = await showDurationPicker(
                        context: context,
                        initialTime: Duration(
                          minutes:
                              AppLocalizations.of(
                                context,
                              )!.minOffTime.isNotEmpty
                              ? int.parse(
                                  AppLocalizations.of(context)!.minOffTime,
                                )
                              : 30,
                        ),
                      );
                      if (duration != null) {
                        context.read<AddloadProvider>().minOffTime = duration
                            .inMilliseconds
                            .toString();
                      }
                    },
                    text: AppLocalizations.of(context)!.minOffTime,
                  ),
                  SizedBox(height: 20.h),
                  CustomDurationPicker(
                    handleDurationChange: () async {
                      Duration? duration = await showDurationPicker(
                        context: context,
                        initialTime: Duration(
                          minutes:
                              AppLocalizations.of(
                                context,
                              )!.maxOffTime.isNotEmpty
                              ? int.parse(
                                  AppLocalizations.of(context)!.maxOffTime,
                                )
                              : 30,
                        ),
                      );
                      if (duration != null) {
                        context.read<AddloadProvider>().maxOffTime = duration
                            .inMilliseconds
                            .toString();
                      }
                    },
                    text: AppLocalizations.of(context)!.maxOffTime,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                context.read<AddloadProvider>().handleAddLoad(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.maxFinite, 50),
                textStyle: AppTextStyles.font16WhiteBold,
              ),
              child: Text(AppLocalizations.of(context)!.addLoad),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
