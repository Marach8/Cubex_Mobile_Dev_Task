import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:readmore/readmore.dart';

class RenderCountryInfo extends StatelessWidget {
  final String keyItem, value;
  const RenderCountryInfo({
    super.key,
    required this.keyItem,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            keyItem.capitalize,
            style: Theme.of(context).textTheme.titleSmall
          ),
          Text(
            ' : ',
            style: Theme.of(context).textTheme.headlineMedium
          ),
      
          const SizedBox(width: 5),
      
          Expanded(
            child: ReadMoreText(
              value,
              trimMode: TrimMode.Length,
              trimExpandedText: CBStrings.SHOW_LESS,
              trimLength: 20,
              style: Theme.of(context).textTheme.headlineMedium
            ),
          )
        ],
      ),
    );
  }
}
