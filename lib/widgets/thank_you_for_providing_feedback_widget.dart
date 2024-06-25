import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';

class ThankYouForProvidingFeedback extends StatelessWidget {
  ThankYouForProvidingFeedback({
    super.key,
  });

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
                  Center(
                    child: Text(
                      '✨',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 55.44,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Thank you for providing your feedback!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF173556),
                      fontSize: 20,
                      fontFamily: FontFamily.avertaDemoPECuttedDemo,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'We appreciate your input and strive to continuously improve our services based on your experience. We have also sent a summary of this call to your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6F8295),
                      fontSize: 16,
                      fontFamily: FontFamily.avertaDemoPECuttedDemo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
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
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
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
            ),
            Spacer(),

            const SizedBox(
              height: 18,
            ),

            SvgPicture.network("https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/powered_by_pressone.svg",),

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