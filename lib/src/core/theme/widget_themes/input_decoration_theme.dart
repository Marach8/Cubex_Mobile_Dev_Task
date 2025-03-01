import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBInputDecorationTheme{
  const CBInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: CBColors.transparent,
    filled: true,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.hex1B1B1B
      )
    ),

    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.hex1B1B1B.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.red.withValues(alpha: 0.3)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.hex1B1B1B
      )
    ),
  );



  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: CBColors.transparent,
    filled: true,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.white.withValues(alpha: 0.5)
      )
    ),

    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.white.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.red.withValues(alpha: 0.3)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: CBColors.white
      )
    ),
  );
}