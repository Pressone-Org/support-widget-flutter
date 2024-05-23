library live_call_widget_flutter;

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
        return _MySdkScreen1();
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

                SizedBox(height: 47,),
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: Text("Modal content goes here"),
      ),
    );
  }
}

class _MySdkScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Screen 3', style: TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () {
              _closeSdk(context);
            },
            child: Text('Close SDK'),
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

