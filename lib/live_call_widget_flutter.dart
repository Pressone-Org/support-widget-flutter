library live_call_widget_flutter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_call_widget_flutter/generated/assets/assets.gen.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';

class MySdk {
  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return _MySdkScreen4();
      },
    );
  }
}

class _MySdkScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
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
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Column(
              children: [
                Padding(
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
                // Assets.svg.callButton.svg(),
              ],
            ),
          ),

          const Spacer(),

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
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => _MySdkScreen2()));
          //   },
          //   child: Text('Next'),
          // ),
        ],
      ),
    );
  }
}

class _MySdkScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
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
                  'Please hold on.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6F8195),
                    fontSize: 32,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  'Connecting you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF173556),
                    fontSize: 32,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'to our team...',
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
                      'Connecting.',
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
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => _MySdkScreen2()));
          //   },
          //   child: Text('Next'),
          // ),
        ],
      ),
    );
  }
}

class _MySdkScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Screen 3', style: TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () {
              _closeSdk(context);
            },
            child: const Text('Close SDK'),
          ),
        ],
      ),
    );
  }

  void _closeSdk(BuildContext context) {
    Navigator.pop(context); // Close Screen 3
    Navigator.pop(context); // Close Screen 2
    Navigator.pop(context); // Close Screen 1
  }
}

class _MySdkScreen4 extends StatefulWidget {
  @override
  _MySdkScreen4State createState() => _MySdkScreen4State();
}

class _MySdkScreen4State extends State<_MySdkScreen4> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Assets.svg.closeBtn.svg(),
            ],
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
                    const Text("Enter your name",
                        style: TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print("Name entered: ${_nameController.text}");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF1671D9),
                            ),
                            shape: MaterialStateProperty.all<CircleBorder>(
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
          // Assets.svg.callButton.svg(),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(CupertinoIcons.refresh_circled, color: Color(0xFF00AEEF)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Connecting.',
                  style: TextStyle(
                    color: Color(0xFF667185),
                    fontSize: 16,
                    fontFamily: FontFamily.avertaDemoPECuttedDemo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
            decoration: const BoxDecoration(
              color: Color(0xFF1571D8),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => _MySdkScreen2()));
          //   },
          //   child: Text('Next'),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
