import 'package:event_bus/event_bus.dart';

import 'event/EventBusManager.dart';


class AppManager{
  static const String TAG = "AppManager";
  static EventBus eventBus  =  EventBusManager.getInstance();
  static initApp() async{
  }
}