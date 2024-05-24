import 'package:flutter/material.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';

class ClickAwayFromAssistance extends StatefulWidget {

  final PageController pageController;

  const ClickAwayFromAssistance({super.key, required this.pageController});

  @override
  State<ClickAwayFromAssistance> createState() => _ClickAwayFromAssistanceState();
}

class _ClickAwayFromAssistanceState extends State<ClickAwayFromAssistance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Stack(
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
                padding: EdgeInsets.symmetric(horizontal: 47),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        'You are a click away from assistance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF173556),
                          fontSize: 24,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 12,
                    ),

                    Text(
                      'Click on the button to talk to someone on our team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6F8195),
                        fontSize: 18,
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(
                      height: 47,
                    ),

                    InkWell(
                      onTap: (){
                        widget.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(26.67),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFF1571D8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF1671D9),
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 1.67,
                            ),
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 1.67,
                              offset: Offset(0, 1.67),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x871671D9),
                              blurRadius: 33.67,
                              offset: Offset(0, 23.33),
                              spreadRadius: -28.33,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: 40, height: 40, ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Assets.svg.callButton.svg(),


                  ],
                ),
              ),

              Spacer(),

              Text.rich(
                TextSpan(
                  text: 'By dialling, you consent to Prime Pay collecting, processing, and storing my information in accordance with our ',
                  style: TextStyle(
                    color: Color(0xFF667185),
                    fontSize: 12,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy Policies.',
                      style: TextStyle(
                        color: Color(0xFF00AEEF),
                        fontSize: 12,
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 18,
              ),

              Image.network("https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/chafinch-flying-flight-bird-animal-ks1_ver_1.png"),

              // Assets.svg.poweredPressone.svg(),

              SizedBox(
                height: 24,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(0xFF1571D8)),
              )
            ],
          )
        ],
      ),
    );
  }
}