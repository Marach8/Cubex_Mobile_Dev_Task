import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:another_flushbar/flushbar.dart';

Future<dynamic> showAppNotification({
  required BuildContext context,
  required Widget? icon,
  required String text,
  int? duration,
  Color? bgColor
}) async {
  return await Flushbar(
    backgroundColor: CBColors.transparent,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: duration ?? 5),
    messageText: Center(
      child: CBContainer(
        radius: 10, color: bgColor ?? CBColors.red,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(icon != null) icon,
            if(icon != null) const SizedBox(width: 10),
            Flexible(
              child: Text(
                text, maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    ),
  ).show(context);
}