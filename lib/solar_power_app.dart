import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/models/local_model.dart';
import 'package:solar_app/routing/app_router.dart';
import 'package:solar_app/routing/app_routes.dart';

class SolarPowerApp extends StatefulWidget {
  final String? lange;
  const SolarPowerApp({super.key, required this.lange});

  @override
  State<SolarPowerApp> createState() => _SolarPowerAppState();
}

class _SolarPowerAppState extends State<SolarPowerApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 815),
      minTextAdapt: true,
      child: ChangeNotifierProvider(
        create: (_) => LocalModel(widget.lange),
        child: Consumer<LocalModel>(
          builder: (context, value, child) => MaterialApp(
            title: 'Solar Power App',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: value.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRouter().generateRoute,
          ),
        ),
      ),
    );
  }
}
