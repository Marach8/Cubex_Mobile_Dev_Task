import 'package:cubex_mobile_dev_task/src/global_export.dart';

class RenderCountryImages extends StatelessWidget {
  const RenderCountryImages({
    super.key,
    required this.countryImageDetails,
  });

  final Map<String, String>? countryImageDetails;

  @override
  Widget build(context) {    
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 1000)),
      builder: (_, snapshot) {
        final shouldShow = snapshot.connectionState == ConnectionState.done;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CBContainer(
              height: shouldShow ? CBHelperFuncs.getScreenHeight(context) * 0.4 : 0,
              width: CBHelperFuncs.getScreenWidth(context),
              child: shouldShow ? PageView.builder(
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
              ) : const SizedBox.shrink(),
            ),

            if(shouldShow) const SizedBox(height: 10),
            if(shouldShow) BlocBuilder<DotIndicatorCubit, int>(
              builder: (_, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    countryImageDetails?.length ?? 3,
                    (index) {
                      final isSelected = index == state;
                      return CBContainer(
                        margin: const EdgeInsets.only(right: 5),
                        color: CBHelperFuncs.getColor(context, isSelected),
                        height: 4, radius: 5,
                        width: isSelected ? 30 : 4,
                        child: const SizedBox.shrink(),
                      );
                    }
                  )
                );
              }
            ),
          ],
        );
      }
    );
  }
}
