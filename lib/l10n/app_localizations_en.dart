// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String get changeLanguage => 'change language';

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get addLoad => 'Add Load';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get loadlist => 'Load List';

  @override
  String get gridPowerDraw => 'grid Power';

  @override
  String get batteryPercent => 'Battery Percent';

  @override
  String get solarPower => 'Solar Power';

  @override
  String get housePower => 'Home Power';

  @override
  String get loadName => 'Load Name';

  @override
  String get loadPriority => 'Load Priority';

  @override
  String get loadPin => 'Load Pin';

  @override
  String get loadPower => 'Load Power';

  @override
  String get minOnTime => 'Min On Time';

  @override
  String get maxOnTime => 'Max On Time';

  @override
  String get minOffTime => 'Min Off Time';

  @override
  String get maxOffTime => 'Max Off Time';

  @override
  String get emptyFeildError => 'This feild cann\'t be empty';

  @override
  String get loadAdded => 'Load has added successfully';

  @override
  String get ok => 'ok';

  @override
  String get connectionLost =>
      'Connection lost to the system, please check the IP address';

  @override
  String get reConnect => 'ReConnect';

  @override
  String get notConnected =>
      'Sorry but you can\'t add load if you are not connected to the board';

  @override
  String get consuming => 'Consuming';

  @override
  String get state => 'state';

  @override
  String get auto => 'auto';

  @override
  String get forcedOff => 'OFF';

  @override
  String get forcedOn => 'ON';

  @override
  String get confirmMsg => 'Are you sure to change load state';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';
}
