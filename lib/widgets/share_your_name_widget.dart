import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:lottie/lottie.dart';

class ShareYourName extends StatefulWidget {
  final PageController pageController;

  const ShareYourName({super.key, required this.pageController});

  @override
  State<ShareYourName> createState() => _ShareYourNameState();
}

class _ShareYourNameState extends State<ShareYourName> {
  final TextEditingController _nameController = TextEditingController();

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

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
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "While we connect you, kindly share your name with us?",
                            style: TextStyle(
                              color: Color(0xFF173556),
                              fontSize: 18,
                              fontFamily: 'AvertaDemoPECuttedDemo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Enter your name',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6F8295),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'gacad@google.com',
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  widget.pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  // print("Name entered: ${_nameController.text}");
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFF1671D9),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<CircleBorder>(
                                    const CircleBorder(),
                                  ),
                                ),
                                child: const Icon(
                                  CupertinoIcons.arrow_right,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Lottie.network(
                          'https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/Connecting.json'),
                    ],
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
                  decoration: BoxDecoration(color: Color(int.parse(widgetConfiguration!.primaryBgColor!.replaceAll('#', '0xFF')))),
                )
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
