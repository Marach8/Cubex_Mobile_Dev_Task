import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBThemeData{
  const CBThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: CBStrings.AXIFORMA,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CBColors.white,
    textTheme: CBTextTheme.lightTextTheme,
    inputDecorationTheme: CBInputDecorationTheme.lightInputDecorationTheme,
    appBarTheme: CBAppBarTheme.lightAppBarTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: CBStrings.AXIFORMA,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CBColors.black,
    textTheme: CBTextTheme.darkTextTheme,
    inputDecorationTheme: CBInputDecorationTheme.darkInputDecorationTheme,
    appBarTheme: CBAppBarTheme.darkAppBarTheme,
  );
}
