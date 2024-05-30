import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';

class WeValueYourFeedback extends StatelessWidget {
  final PageController pageController;

  WeValueYourFeedback({super.key, required this.pageController});

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
              child: SvgPicture.network(widgetConfiguration.logo!, width: 40, height: 40,),
            ),
          ),
        ),

        Column(
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
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We value your feedback',
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
                    'Please rate your call experience below.',
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
                    'How do you feel about this call?',
                    style: TextStyle(
                      color: Color(0xFF4E6785),
                      fontSize: 14,
                      fontFamily: FontFamily.avertaDemoPECuttedDemo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("emoji 1"),
                      SizedBox(
                        width: 9,
                      ),
                      Text("emoji 2"),
                      SizedBox(
                        width: 9,
                      ),
                      Text("emoji 3"),
                      SizedBox(
                        width: 9,
                      ),
                      Text("emoji 4"),
                      SizedBox(
                        width: 9,
                      ),
                      Text("emoji 5"),
                      SizedBox(
                        width: 9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Write your review',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6F8295),
                    ),
                  ),
                  SizedBox(height: 2),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            width: 92,
                            height: 44,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xFFD0D4DD)),
                                borderRadius: BorderRadius.circular(300),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x28464E60),
                                  blurRadius: 0,
                                  offset: Offset(0, 0),
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.network(
                                  "https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/back_btn.svg",
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  'Back',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF475267),
                                    fontSize: 16,
                                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 24,),

                      Expanded(
                        flex: 3,
                        child: Center(
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
                              child: Text(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

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
              decoration: BoxDecoration(color: Color(int.parse(widgetConfiguration!.primaryBgColor!.replaceAll('#', '0xFF')))),
            )
          ],
        )
      ],
    );
  }
}
