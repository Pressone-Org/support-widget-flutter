import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';

class ThankYouForContactingUs extends StatelessWidget {
  final PageController pageController;

   ThankYouForContactingUs({super.key, required this.pageController});

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

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
                color: Color(0xFF1571D8),
                shape: RoundedRectangleBorder(
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
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thank you for contacting us!',
                      style: TextStyle(
                        color: Color(0xFF173556),
                        fontSize: 20,
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Please provide your email address below to receive a summary of the call.',
                      style: TextStyle(
                        color: Color(0xFF6F8295),
                        fontSize: 16,
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Enter your email address',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6F8295),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'gacad@google.com',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle continue button press
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child:Text(
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
              ),
              Spacer(),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(int.parse(widgetConfiguration!.primaryBgColor!.replaceAll('#', '0xFF')))),
              )
            ],
          ),
        ]
    );
  }
}