import 'package:flutter/material.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';

class ThankYouForProvidingFeedback extends StatelessWidget {
  const ThankYouForProvidingFeedback({
    super.key,
  });

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 74.40,
                  height: 74.40,
                  padding: const EdgeInsets.only(
                    top: 8.57,
                    left: 8,
                    right: 7.88,
                    bottom: 7.31,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.58, -0.81),
                      end: Alignment(-0.58, 0.81),
                      colors: [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.07999999821186066)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.07,
                        color: Colors.white.withOpacity(0.20000000298023224),
                      ),
                      borderRadius: BorderRadius.circular(201.69),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F1B4DFF),
                        blurRadius: 40.30,
                        offset: Offset(0, 6.05),
                        spreadRadius: -15.50,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 14.63,
                            left: 18.29,
                            right: 18.16,
                            bottom: 13.65,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.67, color: Color(0xFFE4E7EC)),
                              borderRadius: BorderRadius.circular(212.80),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                  Center(
                    child: Text("Image would be here"),
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
                          style: TextStyle(
                            fontSize: 16,
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
              decoration: BoxDecoration(color: Color(0xFF1571D8)),
            )
          ],
        )
      ],
    );
  }
}