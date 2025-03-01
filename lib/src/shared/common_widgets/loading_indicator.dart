import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBLoadingIndicator extends StatelessWidget {
  final double? size, strokeWidth;
  const CBLoadingIndicator({
    super.key,
    this.size,
    this.strokeWidth
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CBHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;
    
    return SizedBox(
      height: size, width: size,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 2,
          strokeCap: StrokeCap.round,
          backgroundColor: CBColors.transparent,
          color: inDarkMode ? CBColors.white : CBColors.hex1B1B1B
        ),
      ),
    );
  }
}