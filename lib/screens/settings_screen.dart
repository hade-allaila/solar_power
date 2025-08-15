import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/models/local_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Consumer<LocalModel>(
        builder: (context, localeModel, child) => Column(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.changeLanguage),
              trailing: DropdownButton(
                value: selectedLocale,
                items: [
                  DropdownMenuItem(
                    value: "en",
                    child: Text(AppLocalizations.of(context)!.english),
                  ),

                  DropdownMenuItem(
                    value: "ar",
                    child: Text(AppLocalizations.of(context)!.arabic),
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    localeModel.changeLocale(Locale(value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
