library live_call_widget_flutter;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_call_widget_flutter/generated/assets/assets.gen.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/helper/network_helper.dart';
import 'package:live_call_widget_flutter/models/geofencing.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/network/user/user_web_service_impl.dart';
import 'package:fast_rsa/fast_rsa.dart';

class MySdk {
  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return _MySdkScreen2();
      },
    );
  }

  static setAPIKEY(String apiKey) async {
    final NetworkAPICall _networkAPICall = NetworkAPICall();
    _networkAPICall.token = apiKey;

    WidgetConfiguration? widgetConfiguration;

    Line? line;

    widgetConfiguration = await UserWebServiceImpl().getWidgetConfiguration();

    //
    KeyPair keyPair1 = await RSA.generate(2048);

    Geofencing geofencing = Geofencing(public_key: keyPair1.publicKey);

    line = await UserWebServiceImpl().getReceiverLineDetail(geofencing: geofencing);

    line.password = await RSA.decryptOAEP(
      line.password!,
      "",
      Hash.SHA256,
      keyPair1.privateKey,
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

                SizedBox(
                  height: 47,
                ),
                // Assets.svg.callButton.svg(),
              ],
            ),
          ),

          Spacer(),

          Text.rich(
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

class _MySdkScreen2 extends StatefulWidget {
  @override
  State<_MySdkScreen2> createState() => _MySdkScreen2State();
}

class _MySdkScreen2State extends State<_MySdkScreen2> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      child: PageViewWidget(),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Center(
                  child: ThankYouForContactingUs(
                pageController: _pageController,
              )),
              Center(
                  child: WeValueYourFeedback(
                pageController: _pageController,
              )),
              Center(
                child: ThankYouForProvidingFeedback(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ThankYouForContactingUs extends StatelessWidget {
  final PageController pageController;

  const ThankYouForContactingUs({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Text(
                'Thank you for contacting us!',
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
                'Please provide your email address below to receive a summary of the call.',
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
                'Enter your email address',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6F8295),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'gacad@google.com',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              Center(
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
    );
  }
}

class WeValueYourFeedback extends StatelessWidget {
  final PageController pageController;

  const WeValueYourFeedback({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Center(
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
    );
  }
}

class ThankYouForProvidingFeedback extends StatelessWidget {
  const ThankYouForProvidingFeedback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
