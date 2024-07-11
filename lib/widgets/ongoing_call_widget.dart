import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/feedback_model.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/network/user/user_web_service_impl.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';
import 'package:live_call_widget_flutter/widgets/toast/toaster.dart';
import 'package:lottie/lottie.dart';

class OngoingCall extends StatefulWidget {
  final PageController pageController;

  const OngoingCall({super.key, required this.pageController});

  @override
  State<OngoingCall> createState() => _OngoingCallState();
}

class _OngoingCallState extends State<OngoingCall> {
  final CallsViewModel callsViewModel = Get.find();

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  final TextEditingController _messageController = TextEditingController();

  bool _lottieLoader = false;

  int _seconds = 0;

  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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

  String? _selectedCategory = "Sales Enquiries";

  final List<String> _categories = [
    'Sales Enquiries',
    'Product/Service Issue',
    'Payment Issues',
    'Report or Feedback',
  ];

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
        child: Obx(() {
          return callsViewModel.showCallHasFailed.value
              ? Stack(
                  children: [
                    Positioned(
                      top: -60,
                      left: 20,
                      child: Container(
                        width: 170,
                        height: 170,
                        padding: const EdgeInsets.only(
                          top: 89.80,
                          left: 6.80,
                          right: 88.80,
                          bottom: 5.80,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(int.parse(widgetConfiguration
                              .primaryBgColor!
                              .replaceAll('#', '0xFF'))),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1223.02),
                              topRight: Radius.circular(1223.02),
                              bottomLeft: Radius.circular(33.72),
                              bottomRight: Radius.circular(1223.02),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.network(
                            widgetConfiguration.logo!,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "We're sorry, we're unable to take your call at the moment.",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.avertaDemoPECuttedDemo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Please leave a message, and we'll get back to you as soon as possible.",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontFamily.avertaDemoPECuttedDemo,
                              color: Color(0xFF6F8295),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                            value: _selectedCategory,
                            items: _categories.map((category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            },
                            hint: const Text(
                              "Select categories",
                              style: TextStyle(
                                color: Color(0xFF98A1B2),
                                fontSize: 15,
                                fontFamily: FontFamily.avertaDemoPECuttedDemo,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your message',
                              hintStyle: TextStyle(
                                color: Color(0xFF98A1B2),
                                fontSize: 15,
                                fontFamily: FontFamily.avertaDemoPECuttedDemo,
                                fontWeight: FontWeight.w400,
                              ),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_selectedCategory == "" ||
                                      _messageController.text.isEmpty) {
                                    Toaster.showError(context,
                                        message:
                                            "Please fill the form before submitting");
                                  } else {
                                    setState(() {
                                      callsViewModel.feedbackCategoriesMessage
                                          .value = _messageController.text;
                                      callsViewModel.feedbackCategories.value =
                                          _selectedCategory!;
                                      _lottieLoader = true;
                                    });

                                    FeedbackModel feedbackModel =
                                        FeedbackModel();
                                    feedbackModel.message = callsViewModel
                                        .feedbackCategoriesMessage.value;
                                    feedbackModel.category =
                                        callsViewModel.feedbackCategories.value;
                                    feedbackModel.mobile =
                                        callsViewModel.feedbackMobile.value;
                                    feedbackModel.name =
                                        callsViewModel.feedbackName.value;

                                    await UserWebServiceImpl().submitFeedback(
                                        feedbackModel: feedbackModel);

                                    widget.pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: Color(int.parse(
                                      widgetConfiguration.primaryBgColor!
                                          .replaceAll('#', '0xFF'))),
                                ),
                                child: !_lottieLoader
                                    ? const Text(
                                        'Submit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily:
                                              FontFamily.avertaDemoPECuttedDemo,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : Lottie.network(
                                        'https://pressone-prod.fra1.cdn.digitaloceanspaces.com/sdk_images/loading.json'),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          height: 18,
                        ),
                        SvgPicture.network(
                          "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/powered_by_pressone.svg",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Color(int.parse(widgetConfiguration
                                  .primaryBgColor!
                                  .replaceAll('#', '0xFF')))),
                        )
                      ],
                    ),
                  ],
                )
              : Column(
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
                            widgetConfiguration.business?.name ??
                                "No business name",
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
                          color: Color(int.parse(widgetConfiguration
                              .primaryBgColor!
                              .replaceAll('#', '0xFF')))),
                    )
                  ],
                );
        }));
  }
}

//
