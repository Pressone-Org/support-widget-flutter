import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';

class OngoingCall extends StatefulWidget {
  final PageController pageController;

  const OngoingCall({super.key, required this.pageController});

  @override
  State<OngoingCall> createState() => _OngoingCallState();
}

class _OngoingCallState extends State<OngoingCall> {
  final CallsViewModel callsViewModel = Get.find();

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  int _seconds = 0;

  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 17, top: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.network(
                        "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/close.svg")),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    widgetConfiguration.logo!,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widgetConfiguration.business?.name ?? "No business name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF173556),
                    fontSize: 20,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _formatTime(_seconds),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF40B869),
                    fontSize: 16.51,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      callsViewModel.toggleSpeaker();
                    },
                    child: SvgPicture.network(
                        "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/speaker_icon.svg")),
                Spacer(),
                InkWell(
                    onTap: () {
                      callsViewModel.toggleMute();
                    },
                    child: SvgPicture.network(
                        "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/mute_icon.svg")),
                Spacer(),

                Obx(() {
                  // Navigate to LoginScreen if not logged in
                  if (callsViewModel.callHasEnded.value) {
                    widget.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      callsViewModel.hangupCall();

                    },
                    child: SvgPicture.network(
                        "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/end_icon.svg"),
                  );
                }),
              ],
            ),
          ),
          Spacer(),
          SvgPicture.network(
            "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/powered_by_pressone.svg",
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Color(int.parse(widgetConfiguration.primaryBgColor!
                    .replaceAll('#', '0xFF')))),
          )
        ],
      ),
    );
  }
}
