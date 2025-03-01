import 'dart:async';
import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBHelperFuncs{
  const CBHelperFuncs._();

  static double getScreenWidth (BuildContext context)
    => MediaQuery.sizeOf(context).width;
  
  static double getScreenHeight (BuildContext context)
    => MediaQuery.sizeOf(context).height;

  static Brightness getBrightness(BuildContext context)
    => MediaQuery.platformBrightnessOf(context);


  static Timer? _debounce;
  static void callDebouncer(int duration, Function func, [List<dynamic>? args]) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      Duration(milliseconds: duration),
      () {
        if (args != null) {Function.apply(func, args);}
        else {func();}
      }
    );
  }

  static void disposeDebouncer() {
    _debounce?.cancel();
  }



  static Color getColor(BuildContext context, bool isSelected){
    final brightness = getBrightness(context);
    if(brightness == Brightness.light){
      if(isSelected){
        return CBColors.hex1B1B1B;
      }
      return CBColors.black.withValues(alpha: 0.5);
    }
    else{
      if(isSelected){
        return CBColors.white;
      }
      return CBColors.white.withValues(alpha: 0.5);
    }
  }
}