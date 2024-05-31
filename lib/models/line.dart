import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get_it/get_it.dart';
import 'package:live_call_widget_flutter/helper/logger.dart';
import 'package:live_call_widget_flutter/models/counter_model.dart';
import 'package:live_call_widget_flutter/viewmodel/call_notifier.dart';
import 'package:live_call_widget_flutter/viewmodel/calls_viewmodel.dart';
import 'package:sip_ua/sip_ua.dart';

import 'base_model.dart';


class Line with SipUaHelperListener {

  int? username;

  String? password;

  String? host;

  int? port;

  String? protocol;

  String? domain;

  int? extension;

  late RegistrationState _state;
  late CallNotifier _notifier; // reference to view_model.
  late SIPUAHelper? _helper;

  final mediaConstraints = <String, dynamic>{'audio': true, 'video': false};
  MediaStream? _localStream;
  MediaStream? _remoteStream;

  Line({
    this.username,
    this.password,
    this.domain,
    this.host,
    this.port,
    this.protocol,
    this.extension,
  });

  String getUserAgent() {
    return "PressOne";
  }

  String? getPassword() {
    return password;
  }

  String? getUsername() {
    return username.toString();
  }

  String? getDomain() {
    return domain;
  }

  String? getHost() {
    return host;
  }

  String getPort() {
    return port.toString();
  }

  String getProtocol() {
    return protocol ?? "wss";
  }

  String getUri() {
    return "sip:${getUsername()}@${getDomain()}";
  }

  String getWebSocketUrl() {
    return "${getProtocol()}://${getHost()}:${getPort()}";
  }

  DtmfMode getDTMFMode() {
    return DtmfMode.RFC2833;
  }

  Line init(CallNotifier notifier) {
    _helper = SIPUAHelper();
    _notifier = notifier;
    _state = _helper!.registerState;
    _helper!.addSipUaHelperListener(this);
    logger.w("New line is initialized");
    return this;
  }

  bool initialised() {
    return _helper != null;
  }

  void connect() {
    // if (!this.initialised()) {
    //   logger.e("You have not initialised line with helper");
    //   throw Exception("You have not initialised line with helper");
    // }

    try {
      UaSettings settings = UaSettings();
      /*

      settings.iceGatheringTimeout = 3000;
       */
      settings.webSocketSettings.extraHeaders = {
        'Origin': 'co.weprototype.pressone',
        'Proxy-Authorization': 'Digest algorithm'
      };
      settings.iceServers = [
        // {"url": "stun:global.stun.twilio.com:3478?transport=tcp"},
        {
          // "url": "stun:stun.l.google.com:19302",
          "username":
          "3954a9ba53ca219b4e08e17e4436b936c239c07e01b8efeb43a673043bef1ecf",
          "credential": "utacF8wVUlmqdU35APrJSEy5jC77UPxlD4cDTroXVpg="
        }
      ];

      settings.registerParams.extraContactUriParams = <String, String?>{
        // 'app-id': appId,
        'pn-platform': "android",
        // 'pn-voip-tok': fcmToken,
      };

      settings.webSocketSettings.allowBadCertificate = true;
      settings.webSocketUrl = getWebSocketUrl();
      settings.uri = getUri();
      settings.authorizationUser = getUsername();
      settings.password = getPassword();
      // settings.displayName = this.getDisplayName();
      settings.userAgent = getUserAgent();
      settings.dtmfMode = getDTMFMode();

      _helper?.start(settings);
      logger.w("Connect was successful");
      logger.e("Details", {
        "webSocket": getWebSocketUrl(),
        "uri": getUri(),
        "username": getUsername(),
        "password": getPassword(),
        "userAgent": getUserAgent(),
        "DTMFMode": getDTMFMode(),
      });
    } catch (e, st) {
      logger.e("Error connecting sip line", e, st);
    }
    return;
  }

  void call(String phoneNumber) async {
    phoneNumber = phoneNumber.length <= 5
        ? "$phoneNumber@${getDomain()}"
        : phoneNumber;
    MediaStream? mediaStream;
    try {
      mediaStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    }
    catch (e) {

    }
    _helper!
        .call(phoneNumber, voiceonly: true, mediaStream: mediaStream ?? null)
        .then((bool success) {
      if (!success) {
        // AppSnackBar.showErrorSnackBar(message: 'Not connected, you will need to register. Please try again.', title: "Error");
      }
    });
  }

  void transferCall(Call call, String phoneNumber) async {
    phoneNumber = phoneNumber.length <= 5
        ? "$phoneNumber@${getDomain()}"
        : phoneNumber;
    call.refer(phoneNumber);
  }

  void answer(Call call) async {
    final mediaConstraints = <String, dynamic>{'audio': true, 'video': false};
    MediaStream mediaStream;
    mediaStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    try {
      call.answer(_helper!.buildCallOptions(true), mediaStream: mediaStream);
    } catch (e, st) {
      logger.e(e.toString(), e, st);
      call.hangup();
    }
  }

  void _handleStreams(Call call, CallState event) async {
    MediaStream? stream = event.stream;
    if (event.originator == 'local') {
      if (!kIsWeb && !WebRTC.platformIsDesktop) {
        event.stream
            ?.getAudioTracks()
            .first
            .enableSpeakerphone(false);
      }
      _localStream = stream;
    }
    if (event.originator == 'remote') {
      _remoteStream = stream;
    }
  }

  void _closeStream() {
    if (_localStream == null) return;
    _localStream?.getTracks().forEach((track) {
      track.stop();
    });
    _localStream?.dispose();
    _localStream = null;
  }

  void toggleSpeaker(bool speakerOn) {
    if (_localStream != null) {
      if (!kIsWeb) {
        _localStream!.getAudioTracks()[0].enableSpeakerphone(speakerOn);
      }
    }
  }

  @override
  void callStateChanged(Call call, CallState _callState) {
    if (_callState.state == CallStateEnum.CALL_INITIATION) {
      _notifier.newCall(call, this);
      // counterModel.increment();
    }

    if (_callState.state == CallStateEnum.STREAM ||
        _callState.state.name == "STREAM") {
      _handleStreams(call, _callState);
      logger.i(
          'Streaming Streaming. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
    }

    if (_callState.state == CallStateEnum.HOLD ||
        _callState.state == CallStateEnum.UNHOLD) {
      _notifier.setHold(_callState.state == CallStateEnum.HOLD);
      logger.i(
          'Hold Hold. Hold State: ${_callState.state ==
              CallStateEnum.HOLD} State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
    }

    if (_callState.state == CallStateEnum.ACCEPTED) {
      _notifier.callAccepted(call, this);
      _notifier.stopRinging();
      logger.i(
          'Accepted Accepted. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
    }

    if (_callState.state == CallStateEnum.CONFIRMED) {
      _notifier.stopRinging();
      //_handleStreams(call, state);
      logger.i(
          'Confirmed Confirmed. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
    }

    if (_callState.state == CallStateEnum.PROGRESS) {
      logger.i(
          'Progress Progress. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
    }

    if (_callState.state == CallStateEnum.REFER) {}
    if (_callState.state == CallStateEnum.FAILED ||
        _callState.state.name == "FAILED") {
      logger.i(
          'Failed Failed. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');

      if ([408].contains(_callState.cause!.status_code)) {

      } else if ([487].contains(_callState.cause!.status_code)) {

      } else if ([480].contains(_callState.cause!.status_code)) {

      } else if ([486].contains(_callState.cause!.status_code)) {

      } else {

      }

      // if ([408, 480, 603].contains(_callState.cause!.status_code)) {
      //   _notifier.setCallStatusLabel("Call Failed.");
      //   _notifier.callEnded(call, this);
      //   _notifier.stopRinging();
      // }
    }
    if (_callState.state == CallStateEnum.ENDED ||
        _callState.state.name == "ENDED") {
      logger.i(
          'Ended Ended. Connection State: ${EnumHelper.getName(
              _state.state)} | Name - ${(_state.state!
              .name)} |  Caused by ${_callState.cause}');
      _closeStream();
      _notifier.callEnded(call, this);
      _notifier.stopRinging();
    }
    logger.i(
        'Line ${username} Connection State:${EnumHelper.getName(
            _state.state)} . Caused by ${_callState
            .cause} with pressone number');
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    logger.i('New Message Received on ${username}: ${msg.message}');
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    _state = state;
    // viewModel.disconnected.value =true;
    logger.i(
        'Registration State changed for Line ${username}. State: ${EnumHelper
            .getName(_state.state)}. Caused by ${state
            .cause} with pressone number');
  }

  @override
  void transportStateChanged(TransportState state) {
    logger.i(
        'Transport State changed for Line  ${username}. State: ${EnumHelper
            .getName(_state.state)}. Caused by ${state
            .cause} with pressone number');
  }

  bool isRegistered() {
    if (_state == null)
      return false;
    if (_state.state == RegistrationStateEnum.REGISTERED ||
        _state.state == RegistrationStateEnum.NONE) return true;
    return false;
  }

  factory Line.fromJson(Map<String, dynamic> json) =>
      Line(
        username: json['username'],
        extension: json['extension'],
        password: json['password'],
        domain: json['domain'],
        host: json['host'],
        port: json['port'],
        protocol: json['protocol'],
      );

  Map<String, dynamic> toJson() =>
      {
        "username": username,
        "password": password,
        "domain": domain,
        "host": host,
        "port": port,
        "protocol": protocol,
        "extension": extension
      };

  @override
  void onNewNotify(Notify ntf) {
    // TODO: implement onNewNotify
    logger.w("New notify");
  }

}
