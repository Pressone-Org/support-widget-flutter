import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';

class ClickAwayFromAssistance extends StatefulWidget {
  final PageController pageController;

  const ClickAwayFromAssistance({super.key, required this.pageController});

  @override
  State<ClickAwayFromAssistance> createState() =>
      _ClickAwayFromAssistanceState();
}

class _ClickAwayFromAssistanceState extends State<ClickAwayFromAssistance> {

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  final line = GetIt.I.get<Line>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CallsViewModel callsViewModel = Get.find();
    callsViewModel.initialiseLines(line);
  }

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
                color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
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

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
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

                    const SizedBox(
                      height: 12,
                    ),

                    const Text(
                      'Click on the button to talk to someone on our team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6F8195),
                        fontSize: 18,
                        fontFamily: FontFamily.avertaDemoPECuttedDemo,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(
                      height: 47,
                    ),

                    InkWell(
                      onTap: () {
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
                          color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 1.67,
                            ),
                            const BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 1.67,
                              offset: Offset(0, 1.67),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color:Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF'))),
                              blurRadius: 33.67,
                              offset: Offset(0, 23.33),
                              spreadRadius: -28.33,
                            )
                          ],
                        ),
                        child: SvgPicture.network("https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/phone_call.svg",)
                      ),
                    ),
                    // Assets.svg.callButton.svg(),
                  ],
                ),
              ),

              Spacer(),

              const Text.rich(
                TextSpan(
                  text:
                      'By dialling, you consent to Prime Pay collecting, processing, and storing my information in accordance with our ',
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
                decoration: BoxDecoration(color: Color(int.parse(widgetConfiguration.primaryBgColor!.replaceAll('#', '0xFF')))),
              )
            ],
          )
        ],
      ),
    );
  }
}
