import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  String _busyMessage = "Please wait";

  String get busyMessage => _busyMessage;

  set busyMessage(String value) {
    _busyMessage = value;
    notifyListeners();
  }

  ViewState get viewState => _viewState;

  void changeState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  bool isBusy() {
    if (_viewState == ViewState.Busy) return true;
    return false;
  }
}


enum ViewState {
  Idle,
  Busy,
  Verifying,
}
