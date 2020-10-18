import 'package:moodle_flutter/utils/constants.dart';

class EventObject {
  int id;
  Object object;

  EventObject(
      {this.id: EventConstants.NO_INTERNET_CONNECTION, this.object: null});
}
