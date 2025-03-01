import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBFilterWidget extends StatelessWidget {
  final String title;
  final String providerIdentity;
  final TextStyle? style;
  final String? padLeft, padRight;

  const CBFilterWidget({
    super.key,
    required this.title,
    required this.providerIdentity,
    required this.style,
    this.padLeft, 
    this.padRight
  });

  @override
  Widget build(context) {
    // final searchQuery = ref.watch(globalStringProvider(providerIdentity));
    final listOfStrings = title.trim().split('');

    return BlocBuilder<CountriesListBloc, CountriesListState>(
      builder: (_, state) {
        return Text.rich(
          TextSpan(
            children: [
              if(padLeft != null) TextSpan(
                text: padLeft,
                style:style                              
              ),
              ...listOfStrings.map(
                (stringOfText){
                  final shouldHighlightString = ''.contains(stringOfText.toLowerCase());
                  return TextSpan(
                    text: stringOfText,
                    style: shouldHighlightString ? style?.copyWith(
                      color: CBColors.yellow
                    ) : style                              
                  );
                }
              ),
              if(padRight != null) TextSpan(
                text: padRight,
                style:style                              
              ),
            ]
          )
        );
      }
    );
  }
}