import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:iconsax/iconsax.dart';

class CBErrorStateWidget extends StatelessWidget {
  const CBErrorStateWidget({
    super.key, 
    this.imageHeight,
    this.text,
    this.onRefresh
  });

  final double? imageHeight;
  final String? text;
  final VoidCallback? onRefresh;

  @override
  Widget build(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CBImgLoader(
            imagePath: CBImgStrings.EMPTY_STATE,
            height: imageHeight ?? 200,
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            text ?? CBStrings.DATA_UNAVAILABLE,
            style: Theme.of(context).textTheme.titleMedium
          ),
          if(onRefresh != null) const SizedBox(height: 20),
          if(onRefresh != null) GestureDetector(
            onTap: onRefresh,
            child: Icon(Iconsax.refresh, size: 30),
          )
        ],
      ),
    );
  }
}

