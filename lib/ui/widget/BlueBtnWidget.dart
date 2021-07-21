import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/utils/event/EventBusManager.dart';
import 'package:wan_android/utils/event/LoginEvent.dart';

class BlueBtnWidget extends StatelessWidget {
  final String tips;
  final Function login;

  const BlueBtnWidget(this.tips,this.login, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(
                left: 0, top: 20.0, right: 0, bottom: 0.0),
            width: double.infinity,
            height: 50,
            child: TextButton(
              style: ButtonStyle(
                //定义文本的样式 这里设置的颜色是不起作用的
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, color: Colors.white)),
                //设置按钮上字体与图标的颜色
                foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
                //更优美的方式来设置
                // foregroundColor: MaterialStateProperty.resolveWith(
                //       (states) {
                //     if (states.contains(MaterialState.focused) &&
                //         !states.contains(MaterialState.pressed)) {
                //       //获取焦点时的颜色
                //       return Colors.blue;
                //     } else if (states.contains(MaterialState.pressed)) {
                //       //按下时的颜色
                //       return Colors.deepPurple;
                //     }
                //     //默认状态使用灰色
                //     return Colors.grey;
                //   },
                // ),
                //背景颜色
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.blue),
                //设置水波纹颜色
                overlayColor: MaterialStateProperty.all(Colors.yellow),
                //设置阴影  不适用于这里的TextButton
                elevation: MaterialStateProperty.all(0),
                //设置按钮内边距
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 30, right: 30)),
                //设置按钮的大小
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 48)),
                // //设置边框
                // side:
                // MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
                // //外边框装饰 会覆盖 side 配置的样式
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: Text(tips, style: TextStyle(color: Color(0xfff0f0f0))),
            )),
        onTap: () {
          login();
        });
  }
}
