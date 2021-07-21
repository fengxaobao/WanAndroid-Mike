import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/common/component_index.dart';
import 'package:wan_android/data/model/models.dart';
import 'package:wan_android/data/repository/user_repository.dart';
import 'package:wan_android/ui/widget/BlueBtnWidget.dart';
import 'package:wan_android/utils/util_index.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Ids.titleAbout),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            'packages/base_library/assets/ic_login_bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          new _RegisterPage()
        ],
      ),
    );
  }
}

class _RegisterPage extends StatelessWidget {
  FocusNode userNode = FocusNode();
  FocusNode pwdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();
    TextEditingController _reControllerPwd = new TextEditingController();
    UserRepository userRepository = new UserRepository();
    UserModel userModel =
    SpUtil.getObj('user_model', (v) => UserModel.fromJson(v));
    _controllerName.text = userModel?.username ?? "";

    return Column(children: [
      Expanded(child: new Container()),
      Expanded(
          child: new Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      focusNode: userNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 5.0),
                        labelText: 'userName',
                      ),
                      controller: _controllerPwd,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        //转移焦点
                        FocusScope.of(context).requestFocus(pwdNode);
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      focusNode: pwdNode,
                      obscureText: true,
                      controller: _controllerName,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                          contentPadding: EdgeInsets.only(left: 5.0)),
                      textInputAction: TextInputAction.go,
                    )),
                BlueBtnWidget('注册',(){

                  print('网络去注册 ${_controllerName.text}_${ _controllerPwd.text}');
                  var resp = userRepository.login(LoginReq(_controllerName.text, _controllerPwd.text));
                  resp.then((value) => {
                    print('${value.username}')
                  });
                }),
              ],
            ),
          )),
    ]);
  }
}
