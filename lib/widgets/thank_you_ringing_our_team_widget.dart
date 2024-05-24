import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';

class ThankYouRingingOurTeam extends StatefulWidget {

  final PageController pageController;

  const ThankYouRingingOurTeam({super.key, required this.pageController});

  @override
  State<ThankYouRingingOurTeam> createState() => _ThankYouRingingOurTeamState();
}

class _ThankYouRingingOurTeamState extends State<ThankYouRingingOurTeam> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     // Assets.svg.closeBtn.svg()
                //   ],
                // ),
                const Spacer(),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thank you!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6F8195),
                          fontSize: 32,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        'Ringing our',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF173556),
                          fontSize: 32,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'support team...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF173556),
                          fontSize: 32,
                          fontFamily: FontFamily.avertaDemoPECuttedDemo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(
                        height: 47,
                      ),
                      // Assets.svg.callButton.svg(),

                      Row(
                        children: [
                          Icon(CupertinoIcons.refresh_circled,
                              color: Color(0xFF00AEEF)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ringing.',
                            style: TextStyle(
                              color: Color(0xFF667185),
                              fontSize: 16,
                              fontFamily: FontFamily.avertaDemoPECuttedDemo,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const Spacer(),

                const SizedBox(
                  height: 18,
                ),

                // Assets.svg.poweredPressone.svg(),

                const SizedBox(
                  height: 24,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Color(0xFF1571D8)),
                )
              ],
            ),
          ],
        )
    );
  }
}