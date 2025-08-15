import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalModel extends ChangeNotifier {
  late Locale _locale;
  LocalModel(String? lange) { 
    if(lange != null) { 
      _locale = Locale(lange);
    }
    else { 
      _locale = Locale('en');
    }
  }
  Locale get locale  => _locale;

  void changeLocale(Locale newLocale) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", newLocale.toString());
    _locale = newLocale;
    notifyListeners();
  }
}
