// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get hello => 'مرحباً';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get settings => 'الاعدادات';

  @override
  String get home => 'الرئيسية';

  @override
  String get addLoad => 'اضافة حمل';

  @override
  String get english => 'الانكليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get loadlist => 'الاحمال الحالية';

  @override
  String get gridPowerDraw => 'استطاعة الشبكة';

  @override
  String get batteryPercent => 'نسبة البطارية';

  @override
  String get solarPower => 'الطاقة الشمسية';

  @override
  String get housePower => 'استطاعة المنزل';

  @override
  String get loadName => 'اسم الحمل';

  @override
  String get loadPriority => 'أولوية الحمل';

  @override
  String get loadPin => 'مأخذ الحمل';

  @override
  String get loadPower => 'استطاعة الحمل';

  @override
  String get minOnTime => 'وقت التشغيل الاصغري';

  @override
  String get maxOnTime => 'وقت التشغيل الاعظمي';

  @override
  String get minOffTime => 'وقت الاطفاء الاصغري';

  @override
  String get maxOffTime => 'وقت الاطفاء الاعظمي';

  @override
  String get emptyFeildError => 'هذا الحقل لا يمكن أن يكون فارغ';

  @override
  String get loadAdded => 'تم اضافة الحمل بنجاح';

  @override
  String get ok => 'موافق';

  @override
  String get connectionLost =>
      'لقد فقد الاتصال بالمتحكم , تحقق من ال ip وحاول مجددا';

  @override
  String get reConnect => 'اعادة الاتصال';

  @override
  String get notConnected =>
      'لايمكنك اضافة حمل وانت غير متصل بالمتحكم قم بالاتصال وحاول مجددا';

  @override
  String get consuming => 'االاستهلاك';

  @override
  String get state => 'الحالة';

  @override
  String get auto => 'تلقائي';

  @override
  String get forcedOff => 'مطفي';

  @override
  String get forcedOn => 'شغال';

  @override
  String get confirmMsg => 'هل أنت متأكد أنك تريد تغير حالة الحمل';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'الغاء';
}
