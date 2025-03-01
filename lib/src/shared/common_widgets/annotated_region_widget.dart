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
        systemNavigationBarColor: !inDarkMode ? CBColors.white : CBColors.black,
        statusBarColor: inDarkMode ? CBColors.white : CBColors.black,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      ),
      child: child
    );
  }
}