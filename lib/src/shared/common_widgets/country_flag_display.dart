import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:flutter_svg/svg.dart';

class CBFlagDisplay extends StatelessWidget {
  final String flagUrl;
  final BoxFit fit;
  final double? width, height;

  const CBFlagDisplay({
    super.key,
    required this.flagUrl,
    this.fit = BoxFit.contain,
    this.height = 50,
    this.width = 50
  });

  @override
  Widget build(context) {
    try{
      return CBContainer(
        clipBehavior: Clip.hardEdge,
        radius: 8, height: height,
        width: width,
        child: SvgPicture.network(
          flagUrl,
          fit: fit,
          placeholderBuilder: (_) => const CBShimmer(),
          errorBuilder: (_, __, ___) => const CBErrorStateWidget(
            text: CBStrings.UNABLE_2_LOAD_IMG,
          ),
        ),
      );
    }
    catch (_){
      return  const CBErrorStateWidget(
        text: CBStrings.UNABLE_2_LOAD_IMG,
      );
    }
  }
}
