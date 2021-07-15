import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu/no_login_head.dart';

class HomeDrawPage extends StatelessWidget {
  bool isLogin = false;

  @override
  Drawer build(BuildContext context) {
    return Drawer(
        ///edit start
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
          backgroundImage: AssetImage('images/ab.jpg'),
        ),
      );
    } else {
      return HomeMenuNoLoginHead();
    }
  }
}
