import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_call_widget_flutter/helper/logger.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/viewmodel/base_viewmodel_getx.dart';
import 'package:live_call_widget_flutter/viewmodel/call_notifier.dart';
import 'package:sip_ua/sip_ua.dart';

class CallsViewModel extends BaseViewModel implements CallNotifier {

  List<Line> _lines = [];
  Line? _activeLine; // This is the active Line in use. User is able to switch numbers in dialpad_widgets/my_numbers.dart
  Call? _activeCall; // This is null if there is no active call. An active call is not the same as an answered call, or ongoing call.
  RxBool disconnected = false.obs;
  GlobalKey one = GlobalKey();
  GlobalKey two = GlobalKey();
  GlobalKey three = GlobalKey();
  GlobalKey four = GlobalKey();
  GlobalKey five = GlobalKey();
  RxBool _callIsStreaming = false.obs;
  RxBool _callIsAccepted = false.obs;
  RxBool _showNewCall = false.obs;
  RxBool _callIsEnded = false.obs;
  RxString _callStatusLabel = "".obs; //"Calling", "Incoming", "Ended"
  RxBool _shouldAcceptAuto = false.obs; //"Calling", "Incoming", "Ended"
  RxBool _shouldRejectAuto = false.obs; //"Calling", "Incoming", "Ended"



  RxBool _muted = false.obs;
  RxBool _speakerOn = false.obs;
  RxBool _onHold = false.obs;
  RxBool _transfer = false.obs;

  RxString selectedNumber  = "".obs;

  String? voipToken = "";
  String? fcmToken = "";

  RxString loadingMessage = "Please wait".obs;


  RxDouble newCreditBalance = 0.0.obs;
  bool disableCallButton = false;
  RxString businessIdToUseForCallLogs = "".obs;
  bool playNotificationSound = false;
  RxBool showConnecting = false.obs;
  List<bool> addBoolToToggleCallLog = [];

  CallsViewModel() {
    logger.i("Call view model created");
  }

  void initialiseLines(Line? user) {
    if(Platform.isIOS){
      print("initialiseLines");
      try {
        // callkeepHelper = Get.isRegistered<CallkeepHelper>()
        //     ? Get.find()
        //     : Get.put(CallkeepHelper());
      } catch (e) {
        logger.d("ERROR ${e.toString()}");
      }
      // callkeepHelper.initPushkit((CallKeepPushKitToken event) {
      //   this.voipToken = event.token; // update backend with token
      //   try {
      //     // UserWebServiceImpl()
      //     //     .updateDeviceVoIPToken(
      //     //     token: event.token,
      //     //     deviceType: Platform.isIOS ? "ios" : "android")
      //     //     .then((value) {
      //     //   logger.i('VoIP Token Registered => ${event.token}.');
      //     // });
      //   } catch (e) {
      //     logger.e('VoIP Token Registered failed => $e');
      //   }
      //
      //   /// Only iOS devices receive a PushKitToken, so this will only be called on apple phones.
      //   _initLines(user);
      // });
    }

    /// Other non ios devices should initialise line here.
    if (!Platform.isIOS) _initLines(user);
  }

  ///private method called only by initialiseLines
  void _initLines(Line? line) {
    // getContactName();
    if (_lines.isNotEmpty) {
      logger.e("BUG! Looks like we are initialising lines twice");
      return;
    }

    // Activate SIP lines
    // user!.receivers!.forEach((receiver) {
    //   Line? line = receiver.line;
    //
    // });
    if (line != null) {
      line.init(this);
      line.connect();
      _lines.add(line);
    }
    if (_lines.isEmpty) {
      logger.d("There are currently no lines attached to user");
    } else {
      // Set the default active line. In future, try to set this to the last dialed or active line.
      setActiveLine(_lines[0]);
      // if (user.receivers?[0].balance != null)
      //   newCreditBalance.value = user.receivers![0].balance!;
    }
  }

  void setActiveLine(Line? line) {
    _activeLine = line;
  }

  Line? get activeLine {
    if (_activeLine == null) {
      logger.e("No active line to make call");
      return null;
    }
    return _activeLine;
  }


  // void callContact(DeviceContact contact) {
  //   Get.back();
  //   Get.to(() => ActiveCallScreen(), transition: Transition.leftToRight);
  // }

  void callNumber(String phoneNumber) {
    logger.w("Call view model: callNumber called");
    if (_lines.isEmpty) {
      _callIsAccepted.value = false;
      throw Exception("No lines to call");
    }
    // else if (newCreditBalance.value <= 0) {
    //   _callIsAccepted.value = false;
    //   throw Exception("No credit to call");
    // }
    else {
      // numberOfContact.value = phoneNumber;
      // nameOfContact.value.isNotEmpty ? _model.uploadAllContacts(mobile: numberOfContact.value, name: nameOfContact.value, businessNumber: _model.businessNumber?.id, userId: authenticationController.user!.id, ) : null;
      // if(activeLine!.getDisplayName()!.startsWith("0") && !SharedPreferences.getCanCallNigeria()){
      //   throw Exception("Can't make calls with Nigerian number outside Nigeria");
      // } else{
      //
      // }
      // final int callCount = SharedPreferences.retrieveCallCount()!;
      // SharedPreferences.saveCallCounts(callCount + 1);
      activeLine!.call(phoneNumber);
    }
    activeLine!.call(phoneNumber);
  }

  void transferCall(String toNumber) {
    activeLine!.call("*2");
    _activeLine!.transferCall(_activeCall!, toNumber);
  }

  void handleDtmf(String tone) {
    logger.i('Dtmf tone => $tone');
    _activeCall!.sendDTMF(tone);
  }


  void _resetValues() {
    _callIsEnded.value = false;
    _muted.value = false;
    _speakerOn.value = false;
    _onHold.value = false;
    _transfer.value = false;
    _callStatusLabel.value = isIncomingCall.value ? "Incoming" : "Calling";
  }

  //Handles incoming calls
  @override
  void newCall(Call call, line) {
    _resetValues();
    _activeCall = call;
    _activeLine = line;
    _showNewCall.value = true;

    print("new call here");

  }

  RxBool get isOutgoingCall {
    return RxBool(_activeCall?.direction == "OUTGOING");
  }

  RxBool get callInProgress {
    return _callIsAccepted;
  }

  RxBool get callHasEnded {
    return _callIsEnded;
  }

  RxBool get showNewCall {
    return _showNewCall;
  }

  RxBool get acceptAuto {
    return _shouldAcceptAuto;
  }

  RxBool get rejectAuto {
    return _shouldRejectAuto;
  }

  void setAcceptAuto(bool value) {
    _shouldAcceptAuto.value = value;
  }

  void setCallInProgress(bool value) {
    _callIsAccepted.value = value;
  }

  void setRejectAuto(bool value) {
    _shouldRejectAuto.value = value;
  }

  RxString get callStatusLabel {
    return _callStatusLabel;
  }

  void setCallStatusLabel(String label) {
    _callStatusLabel.value = label;
  }

  RxBool get muted {
    return _muted;
  }

  RxBool get onHold {
    return _onHold;
  }

  RxBool get speakerOn {
    return _speakerOn;
  }
  RxBool get transferOn {
    return _transfer;
  }

  RxBool get isIncomingCall {
    return RxBool(_activeCall?.direction == "INCOMING");
  }

  void setCallAccepted(bool accepted) {
    _callIsAccepted.value = accepted;
    if(disableCallButton && !accepted)
      disableCallButton = false;
  }

  /// callEnded gets called when a call has ended. This could happen because
  /// the call was terminated from the other end, or because the user hanged up.
  /// If the user hanged up. hangupCall() is called first, before callEnded. So
  /// be careful, as both code blocks will execute. For example, _backToDialpad()
  /// is called twice, but we do a check in _backToDialpad to prevent double
  /// call issues.
  ///
  /// If the call ended from the other end, only callEnded is called.
  @override
  void callEnded(Call call, Line line) {
    _activeCall = null;
    _callIsEnded.value = true;
    _callIsStreaming.value = false;
    _callIsAccepted.value = false;
    _callStatusLabel.value = "Ended";
    _shouldRejectAuto.value = false;
    _shouldAcceptAuto.value = false;
    disableCallButton = false;
    // Also hanguo native phone system (callkeep)
    if(Platform.isIOS){
      try {
        // callkeepHelper.endCall();
      } catch (e, st) {
        logger.e(e, e, st);
      }
    }
    logger.i("got to this point");

  }

  void rejectCall() {
    logger.i("Call rejected");
    try {
      _activeCall?.hangup({'status_code': 603});
      _activeCall = null;
    } catch (e) {
      logger.e(e);
    } finally {
      _backToDialpad();
    }
  }

  void hangupCall() {
    //@todo  - stop timer.
    try {
      _activeCall?.hangup();
    } catch (e) {
      logger.e(e);
    } finally {
      _backToDialpad();
      // nameOfContact.value = "";
    }
  }

  void _backToDialpad() {
    // if (callInProgress.value) {
    //   AppSnackBar.showErrorSnackBar(
    //       message: "Call in progress, please wait", title: '');
    // } else {
    //   if (Get.currentRoute != DialPad.routeName) Get.back();
    // }
  }

  void answerCall() async {
    _activeLine!.answer(_activeCall!);
    if(Platform.isIOS){
      try {
        // await callkeepHelper.answerCall();
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void callAnsweredFromPhone() async {
    _activeLine!.answer(_activeCall!);
  }

  void toggleMute() {
    if (_muted.value) {
      _activeCall!.unmute(true, false);
      _muted.value = false;
    } else {
      _activeCall!.mute(true, false);
      _muted.value = true;
    }
    if(Platform.isIOS){
      // callkeepHelper.toggleMuteCall(_muted.value);
    }
  }

  @override
  void setHold(bool hold) {
    _onHold.value = hold;
  }

  void setTransfer(bool transfer) {
    _transfer.value = transfer;
  }

  @override
  void setMuted(bool muted) {
    if (muted) {
      _activeCall!.mute(muted, false);
    } else {
      _activeCall!.unmute(true, false);
    }
    _muted.value = muted;
  }

  void toggleHold() {
    if (_onHold.value) {
      _activeCall!.unhold();
      _onHold.value = false;
    } else {
      _activeCall!.hold();
      _onHold.value = true;
    }
    if(Platform.isIOS){
      // callkeepHelper.toggleHoldCall(_onHold.value);
    }
  }

  void toggleSpeaker() {
    _speakerOn.value = !_speakerOn.value;
    activeLine!.toggleSpeaker(_speakerOn.value);
  }

  void callStreaming(Call call, Line line) {
    _callIsStreaming.value = true;
  }

  void callAccepted(Call call, Line line) {
    _callStatusLabel.value = "";
    _callIsAccepted.value = true;

    //Algorithm - Detecting failed calls from Frontend

    ///Find Call duration
    int _duration = 0;
    // Future.delayed(const Duration(seconds: 3), () {
    //   try {
    //     DateTime? _startTime = DateTime.now();
    //     print("_startTime: $_startTime");
    //     if (_startTime != null) {
    //       DateTime _endTime = call.session.end_time!;
    //       print("_endTime: $_startTime");
    //       _duration = _endTime.difference(_startTime).inSeconds;
    //     }
    //   } catch (e) {
    //     logger.e("Error calculating duration from Call session", e);
    //   }
    // });
    // String? pressOneNumber =_activeLine!.receiver!.businessNumber!.phoneNumber;

  }

  void startRinging() {

  }

  void stopRinging() {
    // FlutterRingtonePlayer.stop();
  }

  String? getPushKitToken() {
    return voipToken;
  }

  String? getFCMToken() {
    return fcmToken;
  }

  void connectLines() {
    _lines.forEach((Line _line) {
      if (_line.isRegistered()) {
        // logger.i("Line ${_line!.} already registered");
      } else {
        _line.connect();
      }
    });
  }

  void notifyIncomingCall(call) {
    //do nothing for now. We did this to attempt an hack
  }

  bool isRegistered() {
    return _activeLine?.isRegistered() == true;
  }

  void dispose() {
    logger.i("Call view model destroyed");
    super.dispose();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

}

