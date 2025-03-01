import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:shimmer/shimmer.dart';

class CBShimmer extends StatelessWidget {
  const CBShimmer({
    super.key,
  });

  @override
  Widget build(context) {
    return Center(
      child: Shimmer.fromColors(
        period: const Duration(seconds: 1),
        baseColor: CBColors.white,
        highlightColor: CBColors.hex1B1B1B,
        child: Container(
          color: CBColors.yellow
        ),
      ),
    );
  }
}