import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  bool _speaker = false;

  bool _mute = false;

  bool _end = false;

  int get counter => _counter;

  bool get speaker => _speaker;

  bool get mute => _mute;

  bool get end => _end;

  void changeSpeaker(){
    _speaker = !_speaker;
    notifyListeners();
  }

  void changeMute(){
    _mute = !_mute;
    notifyListeners();
  }

  void changeEnd(){
    _end = !_end;
    notifyListeners();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
