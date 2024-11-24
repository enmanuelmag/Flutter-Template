import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/shared/divider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final String? title;

  const BottomSheetContainer({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 32,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null)
              Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      title!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Separator(
                    horizontal: 18,
                  ),
                ],
              ),
            child,
          ],
        ),
      ),
    );
  }
}

void showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  String? title,
}) {
  // ignore: inference_failure_on_function_invocation
  showMaterialModalBottomSheet(
    bounce: true,
    elevation: 10,
    enableDrag: true,
    isDismissible: true,
    animationCurve: Curves.easeInOut,
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    builder: (BuildContext context) => BottomSheetContainer(
      title: title,
      child: child,
    ),
  );
}
