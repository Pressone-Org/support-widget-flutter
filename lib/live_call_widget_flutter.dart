library live_call_widget_flutter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/helper/storage/storage.dart';
import 'package:live_call_widget_flutter/models/counter_model.dart';
import 'package:live_call_widget_flutter/models/geofencing.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/network/user/user_web_service_impl.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';
import 'package:live_call_widget_flutter/widgets/click_away_from_assistance_widget.dart';
import 'package:live_call_widget_flutter/widgets/connecting_widget.dart';
import 'package:live_call_widget_flutter/widgets/enter_your_number_widget.dart';
import 'package:live_call_widget_flutter/widgets/ongoing_call_widget.dart';
import 'package:live_call_widget_flutter/widgets/please_hold_on_widget.dart';
import 'package:live_call_widget_flutter/widgets/ringing_widget.dart';
import 'package:live_call_widget_flutter/widgets/share_your_name_widget.dart';
import 'package:live_call_widget_flutter/widgets/thank_you_for_contacting_us_widget.dart';
import 'package:live_call_widget_flutter/widgets/thank_you_for_providing_feedback_widget.dart';
import 'package:live_call_widget_flutter/widgets/thank_you_ringing_our_team_widget.dart';
import 'package:live_call_widget_flutter/widgets/we_value_your_feedback_widget.dart';

import 'config/app_constants.dart';

class LiveCallWidget {

  static Future<void> showWidget(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return MainBottomSheet();
      },
    );
  }

  static setAPIKEY(String apiKey) async {

    WidgetConfiguration? widgetConfiguration = await UserWebServiceImpl().getWidgetConfiguration(token: apiKey);

    if (GetIt.I.isRegistered<WidgetConfiguration>()) {
      GetIt.I.unregister<WidgetConfiguration>();
      GetIt.I.registerLazySingleton<WidgetConfiguration>(() => widgetConfiguration);
    } else {
      GetIt.I.registerLazySingleton<WidgetConfiguration>(() => widgetConfiguration);
    }


    KeyPair keyPair1 = await RSA.generate(2048);

    Geofencing geofencing = Geofencing(public_key: keyPair1.publicKey);

    Line line = await UserWebServiceImpl().getReceiverLineDetail(geofencing: geofencing, token: apiKey);

    if (GetIt.I.isRegistered<Line>()) {
      GetIt.I.unregister<Line>();
      GetIt.I.registerLazySingleton<Line>(() => line);
    } else {
      GetIt.I.registerLazySingleton<Line>(() => line);
    }

    line.password = await RSA.decryptOAEP(
      line.password!,
      "",
      Hash.SHA256,
      keyPair1.privateKey,
    );

    Get.put(CallsViewModel());

  }

}


class MainBottomSheet extends StatefulWidget {
  @override
  State<MainBottomSheet> createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
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
      child: _PageViewWidget(),
    );
  }
}

class _PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<_PageViewWidget> {
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

              // Screen one
              Center(
                  child: ClickAwayFromAssistance(
                    pageController: _pageController,
                  )),

              // Screen two
              Center(
                  child: PleaseHoldOn(
                    pageController: _pageController,
                  )),

              // Screen two
              Center(
                  child: Connecting(
                    pageController: _pageController,
                  )),

              // Screen three
              Center(
                  child: ShareYourName(
                    pageController: _pageController,
                  )),

              Center(
                  child: Connecting(
                    pageController: _pageController,
                  )),

              // Screen three
              Center(
                  child: Ringing(
                    pageController: _pageController,
                  )),

              // Screen four
              Center(
                  child: ThankYouRingingOurTeam(
                    pageController: _pageController,
                  )),

              // Screen four
              Center(
                  child: Ringing(
                    pageController: _pageController,
                  )),

              // Screen five
              Center(
                  child: EnterYourNumber(
                    pageController: _pageController,
                  )),

              Center(
                  child: OngoingCall(
                    pageController: _pageController,
                  )),

              // Screen five
              Center(
                  child: ThankYouForContactingUs(
                    pageController: _pageController,
                  )),

              // Screen five
              Center(
                  child: WeValueYourFeedback(
                    pageController: _pageController,
                  )),

              // Screen six
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
