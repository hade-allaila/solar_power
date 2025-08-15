import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/widgets/status_item.dart';

class SystemStatusConsumer extends StatelessWidget {
  const SystemStatusConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return GridView(
          shrinkWrap: true,
          clipBehavior: Clip.none,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            StatusItem(
              title: AppLocalizations.of(context)!.batteryPercent,
              value: value.data?.batterPercent.toString() ?? "0",
              icon: Icons.radar_rounded,
              iconColor: Colors.deepOrangeAccent,
              unit: "%",
            ),
            StatusItem(
              title: AppLocalizations.of(context)!.gridPowerDraw,
              value: value.data?.gridPowerDraw.toString() ?? "0",
              icon: Icons.radar_rounded,
              iconColor: Colors.lightGreen,
              unit: "W",
            ),
            StatusItem(
              title: AppLocalizations.of(context)!.housePower,
              value: value.data?.housePower.toString() ?? "0",
              icon: Icons.radar_rounded,
              iconColor: Colors.purpleAccent,
              unit: "W",
            ),
            StatusItem(
              title: AppLocalizations.of(context)!.solarPower,
              value: value.data?.solarPower.toString() ?? "0",
              icon: Icons.radar_rounded,
              iconColor: const Color.fromARGB(255, 26, 226, 226),
              unit: "W",
            ),
          ],
        );
      },
    );
  }
}
