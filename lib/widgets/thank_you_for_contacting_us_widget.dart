import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';
import 'package:live_call_widget_flutter/widgets/toast/toaster.dart';

class ThankYouForContactingUs extends StatefulWidget {
  final PageController pageController;

   ThankYouForContactingUs({super.key, required this.pageController});

  @override
  State<ThankYouForContactingUs> createState() => _ThankYouForContactingUsState();
}

class _ThankYouForContactingUsState extends State<ThankYouForContactingUs> {

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  final TextEditingController _emailController = TextEditingController();

  CallsViewModel callsViewModel = Get.find();


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                color:Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
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
                child: Image.network(widgetConfiguration.logo!, width: 40, height: 40,),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Obx((){
               return callsViewModel.showCallHasFailed.value ?
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Center(
                       child: Text(
                         '👏🏽',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 55.44,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ),
                     const SizedBox(
                       height: 24,
                     ),
                     const Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20),
                       child: Text(
                         'Thank you for leaving your message!',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Color(0xFF173556),
                           fontSize: 20,
                           fontFamily: FontFamily.avertaDemoPECuttedDemo,
                           fontWeight: FontWeight.w800,
                         ),
                       ),
                     ),
                     const SizedBox(
                       height: 12,
                     ),
                     const Text(
                       "We've received your message and will get back to you shortly.",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Color(0xFF6F8295),
                         fontSize: 16,
                         fontFamily: FontFamily.avertaDemoPECuttedDemo,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                     const SizedBox(
                       height: 32,
                     ),
                     Center(
                       child: SizedBox(
                         width:  MediaQuery.of(context).size.width / 2,
                         height: 50,
                         child: ElevatedButton(
                           onPressed: () {
                             // Handle continue button press
                             Navigator.pop(context);
                           },
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(25),
                             ),
                             backgroundColor: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
                           ),
                           child: const Text(
                             'Return home',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 16,
                               fontFamily: FontFamily.avertaDemoPECuttedDemo,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ) :

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thank you for contacting us!',
                        style: TextStyle(
                          color: Color(0xFF173556),
                          fontSize: 20,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Please provide your email address below to receive a summary of the call.',
                        style: TextStyle(
                          color: Color(0xFF6F8295),
                          fontSize: 16,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Enter your email address',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6F8295),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'timi@google.com',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_emailController.text.isEmpty) {
                                  callsViewModel.feedbackEmail.value = _emailController.text;
                                  widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                  if (!emailRegex.hasMatch(_emailController.text)) {
                                    Toaster.showError(context, message: "Please enter a valid email");
                                  } else {
                                    callsViewModel.feedbackEmail.value = _emailController.text;
                                    widget.pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
                            ),
                            child: const Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: FontFamily.avertaDemoPECuttedDemo,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const Spacer(),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF')))),
              )
            ],
          ),
        ]
    );
  }
}