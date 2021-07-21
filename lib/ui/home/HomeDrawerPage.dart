import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/utils/event/EventBusManager.dart';
import 'package:wan_android/utils/event/LoginEvent.dart';

import 'menu/no_login_head.dart';

class HomeDrawerPage extends StatefulWidget {
  @override
  _HomeDrawerPageState createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    EventBusManager.listen<LoginEvent>(
            (event) {
          if (event.status == LoginEvent.eventIn) {
            isLogin = true;
            print('登录成功');
          } else {
            isLogin = false;
            print('退出成功');
          }
          setState(() {

          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: InkWell(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              showHeadWidget(isLogin),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置'),
                onLongPress: () => {Scaffold.of(context).openEndDrawer()},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.safety_divider_rounded),
                title: Text('调整'),
                onLongPress: () => {Scaffold.of(context).openEndDrawer()},
              ),
              Divider(),
            ],
          ),
        )

      ///edit end
    );
  }

  Widget showHeadWidget(bool isLogin) {
    if (isLogin) {
      return UserAccountsDrawerHeader(
        accountEmail: Text('wo shi Email'),
        accountName: Text('我是Drawer'),
        onDetailsPressed: () {},
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('data/images/icon_wan_android.png'),
        ),
      );
    } else {
      return HomeMenuNoLoginHead();
    }
  }
}
