import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as marach show log;

class CBImgLoader extends StatelessWidget {
  final String imagePath;
  final String? package;
  final BoxFit boxFit;
  final double? height, width;

  const CBImgLoader({
    super.key,
    required this.imagePath,
    this.height = 40,
    this.width = 40,
    this.package,
    this.boxFit = BoxFit.contain
  });

  @override
  Widget build(BuildContext context) {
    final imageExtension = imagePath.split('.').last;
    marach.log(imageExtension);
    //For NetWork images
    if(imagePath.startsWith('http://') || imagePath.startsWith('https://')){
      if(imageExtension == 'jpg' || imageExtension == 'png'){
        return Image.network(
          imagePath,
          fit: boxFit,
          height: height,
          width: width,
          loadingBuilder: (_, __, ___) => const CBShimmer(),
        );
      }

      else if(imageExtension == 'svg'){
        return SvgPicture.network(
          imagePath, 
          fit: boxFit,
          height: height,
          width: width,
          placeholderBuilder: (_) => const CBShimmer(),
        );
      }

      //This should never happen
      return const SizedBox.shrink();
    }



    //For Asset images
    else if(imageExtension == 'jpg' || imageExtension == 'png'){
      return Image.asset(
        imagePath,
        fit: boxFit,
        height: height,
        width: width,
        package: package,
      );
    }

    else if(imageExtension == 'svg'){
      return SvgPicture.asset(
        imagePath, 
        fit: boxFit,
        height: height,
        width: width,
        package: package,
      );
    }

    //This should never happen
    return const SizedBox.shrink();
  }
}