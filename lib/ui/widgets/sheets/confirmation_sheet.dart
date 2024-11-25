import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/shared/divider.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ConfirmationSheet extends StatelessWidget {
  final Widget child;
  final String title;
  final String? confirmText;
  final String? cancelText;
  final void Function() onConfirm;
  final void Function()? onCancel;

  const ConfirmationSheet({
    super.key,
    required this.child,
    required this.title,
    this.confirmText,
    this.cancelText,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12,
          top: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Separator(
                  horizontal: 18,
                ),
              ],
            ),
            child,
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonExtended(
                  text: confirmText ?? 'Confirm',
                  onPressed: onConfirm,
                  variant: ButtonVariant.contained,
                  color: ButtonColor.primary,
                ),
                const SizedBox(width: 8),
                ButtonExtended(
                  text: cancelText ?? 'Cancel',
                  onPressed: onCancel,
                  variant: ButtonVariant.contained,
                  color: ButtonColor.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required Widget child,
    required String title,
    String? confirmText,
    String? cancelText,
    required void Function() onConfirm,
    void Function()? onCancel,
  }) {
    // ignore: inference_failure_on_function_invocation
    showMaterialModalBottomSheet(
      bounce: true,
      elevation: 10,
      enableDrag: true,
      isDismissible: true,
      animationCurve: Curves.easeInOut,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (BuildContext context) => ConfirmationSheet(
        title: title,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        child: child,
      ),
    );
  }
}
