import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBAppBarTheme{
  const CBAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: CBColors.white,
    titleTextStyle: TextStyle(
      color: CBColors.hex1B1B1B,
      fontSize: CBFontSizes.size16,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: CBColors.black,
    titleTextStyle: TextStyle(
      color: CBColors.white,
      fontSize: CBFontSizes.size16,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
