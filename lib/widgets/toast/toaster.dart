import 'package:flutter/material.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';

class Toaster {
  static showError(BuildContext context, {required String message}) {
    _showMessage(context, message: message, isError: true);
  }

  static showSuccess(BuildContext context, {required String message}) {
    _showMessage(context, message: message, isError: false);
  }

  static Future _showMessage(BuildContext context, {required String message, required bool isError}) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 90,
        right: 0.0,
        left: 0.0,
        child: _MessageWidget(
          message: message,
          isErrorMessage: isError,
        ),
      ),
    );
    overlayState?.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 2));
    overlayEntry.remove();
  }
}

class _MessageWidget extends StatelessWidget {
  final String message;
  final bool isErrorMessage;

  const _MessageWidget({required this.message, required this.isErrorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(minHeight: 48),
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                  color: isErrorMessage ? Color(0xFFFDECEF) : Color(0xff25BAD7),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    message,
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isErrorMessage ? Color(0xFFEA4160) : Color(0xff1671D9)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
