import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:iconsax/iconsax.dart';

class CBTextField extends StatelessWidget {
  final bool? enabled;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? hintText;
  const CBTextField({
    super.key,
    this.enabled,
    this.onChanged,
    this.hintText,
    this.suffixIcon
  });

  @override
  Widget build(context) {
    final brightness = CBHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;

    return TextField(
      enabled: enabled, 
      cursorColor: inDarkMode ? CBColors.white : CBColors.hex1B1B1B,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Iconsax.search_normal_14, size: 20),
        suffixIcon: suffixIcon
      ),
    );
  }
}



