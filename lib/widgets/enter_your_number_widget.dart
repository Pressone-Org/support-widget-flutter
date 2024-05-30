import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live_call_widget_flutter/generated/assets/fonts.gen.dart';
import 'package:live_call_widget_flutter/models/counter_model.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/value_listener.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';
import 'package:lottie/lottie.dart';

class EnterYourNumber extends StatefulWidget {
  final PageController pageController;

  const EnterYourNumber({super.key, required this.pageController});

  @override
  State<EnterYourNumber> createState() => _EnterYourNumberState();
}

class _EnterYourNumberState extends State<EnterYourNumber> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final widgetConfiguration = GetIt.I.get<WidgetConfiguration>();

  CallsViewModel callsViewModel = Get.find();

  final counterModel = GetIt.I.get<CounterModel>();

  ValueListener valueListener = ValueListener();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Attach a listener to the counter model
    counterModel.addListener(() {
      valueListener.onCounterChanged(counterModel.counter);
    });
  }

  @override
  void dispose() {
    counterModel.removeListener(() {});
    _phoneNumberController.dispose();
    super.dispose();
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
                            "Enter your phone number to enable call back",
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
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6F8295),
                            ),
                          ),
                          SizedBox(height: 8),

                          Row(
                            children: [
                              Expanded(
                                child: IntlPhoneField(
                                  iconPosition: IconPosition.trailing,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: "8148642968"
                                  ),
                                  initialCountryCode: 'NG', // Nigeria
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                    print(phone.number.toString());
                                    _phoneNumberController.text = phone.number.toString();// Output the full number when it changes
                                  },
                                ),
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              ElevatedButton(
                                onPressed: () {

                                  callsViewModel.callNumber("02017003023");

                                  if(callsViewModel.showNewCall.value){
                                    print("Over here");
                                    // widget.pageController.nextPage(
                                    //   duration: Duration(milliseconds: 300),
                                    //   curve: Curves.easeInOut,
                                    // );
                                    // counterModel.decrement();
                                  }

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


                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Lottie.network(
                          'https://pressone-prod.fra1.cdn.digitaloceanspaces.com/Mobile/Ringing.json'),
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