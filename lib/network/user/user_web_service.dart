import 'package:live_call_widget_flutter/models/feedback_model.dart';
import 'package:live_call_widget_flutter/models/geofencing.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';

abstract class UserWebService {
  Future<WidgetConfiguration> getWidgetConfiguration({required String token});
  Future<Line> getReceiverLineDetail({required Geofencing geofencing, required String token});
  Future<dynamic> submitFeedback({required FeedbackModel feedbackModel});
}
