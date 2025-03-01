import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:flutter/services.dart';


class CBAnnotatedRegion extends StatelessWidget {
  final Widget child;

  const CBAnnotatedRegion({
    super.key,
    required this.child,
  });

  @override
  Widget build(context) {
    final brightness = CBHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: inDarkMode ? CBColors.black : CBColors.white,
        statusBarColor: inDarkMode ? CBColors.black : CBColors.white,
        statusBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: child
    );
  }
}