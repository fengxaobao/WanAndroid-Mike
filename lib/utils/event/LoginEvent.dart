import 'EventBusManager.dart';

class LoginEvent extends Event {
  static int eventIn = 1;
  static int eventOut = 0;
  final int status;

  LoginEvent(this.status);
}
