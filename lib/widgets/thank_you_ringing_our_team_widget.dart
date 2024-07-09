import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:lottie/lottie.dart';

class ThankYouRingingOurTeam extends StatefulWidget {

  final PageController pageController;

  const ThankYouRingingOurTeam({super.key, required this.pageController});

  @override
  State<ThankYouRingingOurTeam> createState() => _ThankYouRingingOurTeamState();
}

class _ThankYouRingingOurTeamState extends State<ThankYouRingingOurTeam> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
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
                  color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
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

                const Spacer(),

                 Padding(
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


                      Row(
                        children: [
                          Lottie.network(
                              'https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/Connecting.json'),
                        ],
                      )
                    ],
                  ),
                ),

                const Spacer(),

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
            ),
          ],
        )
    );
  }
}