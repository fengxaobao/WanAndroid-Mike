import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/home/login/UserLoginPage.dart';
import 'package:wan_android/utils/navigator_util.dart';

class HomeMenuNoLoginHead extends StatefulWidget {
  @override
  _HomeMenuNoLoginPage createState() => _HomeMenuNoLoginPage();
}

class _HomeMenuNoLoginPage extends State<HomeMenuNoLoginHead> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      ///背景
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: InkWell(
        /// 点击进入登录界面
        onTap: () => {print('去登陆')}, //点击
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          child: Column(
            children: <Widget>[
              ///头像
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 38.0,
                  child: Image.asset("assets/images/icon_wan_android.png"),
                ),
              ),
              FlatButton(
                color: Colors.black26,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("去登陆1" ,style: TextStyle(color: Colors.white),),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                   return UserLoginPage();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
