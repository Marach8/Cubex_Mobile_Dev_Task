import 'package:cubex_mobile_dev_task/src/global_export.dart';

class RenderCountryImages extends StatelessWidget {
  const RenderCountryImages({
    super.key,
    required this.countryImageDetails,
  });

  final Map<String, String>? countryImageDetails;

  @override
  Widget build(context) {
    return SizedBox(
      height: CBHelperFuncs.getScreenHeight(context) * 0.4,
      width: CBHelperFuncs.getScreenWidth(context),
      child: PageView.builder(
        itemCount: countryImageDetails?.length,
        onPageChanged: (pageIndex) => context.read<DotIndicatorCubit>().goToPage(pageIndex),
        itemBuilder: (_, pageIndex){
          final flagUrl = countryImageDetails?.values.elementAtOrNull(pageIndex);
          return CBFlagDisplay(
            flagUrl: flagUrl ?? '',
            height: CBHelperFuncs.getScreenHeight(context) * 0.4,
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }
}