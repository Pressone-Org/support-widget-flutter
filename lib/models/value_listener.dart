class ValueListener {
  void onCounterChanged(int newCounterValue) {
    print(newCounterValue);
    // React to the new counter value
    print("Counter value changed to: $newCounterValue");
  }

  void onSpeakerChanged(bool newSpeakerValue) {
    // React to the new counter value
    print("Counter value changed to: $newSpeakerValue");
  }

  void onMuteChanged(bool newMuteValue) {
    // React to the new counter value
    print("Counter value changed to: $newMuteValue");
  }

  void onEndChanged(bool newEndValue) {
    // React to the new counter value
    print("Counter value changed to: $newEndValue");
  }
}
