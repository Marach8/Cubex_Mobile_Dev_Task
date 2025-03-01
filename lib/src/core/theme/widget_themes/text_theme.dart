import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBTextTheme{
  const CBTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 
    headlineMedium: TextStyle(
      color: CBColors.hex1B1B1B,
      fontSize: CBFontSizes.size20,
      fontWeight: CBFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),


    titleSmall: TextStyle(
      color: CBColors.hex1B1B1B,
      fontSize: CBFontSizes.size16,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    
    bodySmall: TextStyle(
      color: CBColors.hex1B1B1B,
      fontSize: CBFontSizes.size14,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    
    labelMedium: TextStyle(
      color: CBColors.hex1B1B1B,
      fontSize: CBFontSizes.size12,
      fontWeight: CBFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );



  static TextTheme darkTextTheme = TextTheme( 

    headlineMedium: TextStyle(
      color: CBColors.white,
      fontSize: CBFontSizes.size20,
      fontWeight: CBFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    titleSmall: TextStyle(
      color: CBColors.white,
      fontSize: CBFontSizes.size16,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    bodySmall: TextStyle(
      color: CBColors.white,
      fontSize: CBFontSizes.size14,
      fontWeight: CBFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(
      color: CBColors.white,
      fontSize: CBFontSizes.size10,
      fontWeight: CBFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );

}