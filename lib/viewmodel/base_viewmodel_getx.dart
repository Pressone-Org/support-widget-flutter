import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  Rx<ViewState> viewState = ViewState.Idle.obs;

  RxString busyMessage = "Please wait".obs;

  // String get busyMessage => _busyMessage;

  // set busyMessage(String value) {
  //   _busyMessage = value;
  //   notifyListeners();
  // }

  // ViewState get viewState => _viewState;

  // void changeState (ViewState newState) {
  //   _viewState = newState;
  //   notifyListeners();
  // }

  bool isBusy() {
    if (viewState.value == ViewState.Busy) return true;
    return false;
  }
}

enum ViewState {
  Idle,
  Busy,
  Verifying,
}
