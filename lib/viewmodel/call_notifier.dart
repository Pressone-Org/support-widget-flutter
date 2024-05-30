import 'package:flutter/foundation.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:sip_ua/sip_ua.dart';

abstract class CallNotifier extends ChangeNotifier {
  void newCall(Call call, Line line);
  void callEnded(Call call, Line line);
  void callStreaming(Call call, Line line);
  void callAccepted(Call call, Line line);
  void setHold(bool hold);
  void setMuted(bool muted);
  void startRinging();
  void stopRinging();
  void setCallStatusLabel(String label);
  String? getPushKitToken();
  String? getFCMToken();
  void connectLines();
  void notifyIncomingCall(Call call);
}
