import 'package:flutter/material.dart';
import 'package:wan_android/res/colors.dart';
import 'package:wan_android/res/strings.dart';
import 'package:wan_android/ui/home/HomeDrawerPage.dart';
import 'package:wan_android/utils/sp_helper.dart';
import 'package:wan_android/utils/util_index.dart';
import 'package:flutter/material.dart';
import 'common/common.dart';
import 'models/models.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_library/base_library.dart';
import 'dart:io';
import 'package:dio/dio.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mike WanAndroid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mike WanAndroid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _locale;
  Color _themeColor = ColorRes.app_main;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLocalizedValues(localizedValues);
    _loadLocale();
    _init();
  }
  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.server_address;
    String cookie = SpUtil.getString(BaseConstant.keyAppToken);
    if (ObjectUtil.isNotEmpty(cookie)) {
      Map<String, dynamic> _headers = new Map();
      _headers["Cookie"] = cookie;
      options.headers = _headers;
    }
    var config =  HttpConfig(options: options);
    DioUtil().setConfig(config);
  }


  void _loadLocale() {
    setState(() {
      LanguageModel model =
          SpUtil.getObj(Constant.keyLanguage, (v) => LanguageModel.fromJson(v));
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpHelper.getThemeColor();
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: _locale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          CustomLocalizations.delegate
        ],
        supportedLocales: CustomLocalizations.supportedLocales,

        home: DefaultTabController(
          initialIndex: 1,
          length: 4,
          child: Scaffold(
            drawer: HomeDrawerPage(),
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "主页",
                  ),
                  Tab(
                    text: "项目",
                  ),
                  Tab(
                    text: "动态",
                  ),
                  Tab(
                    text: "体系",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: <Widget>[
                Center(
                  child: Text("It's cloudy here"),
                ),
                Center(
                  child: Text("It's rainy here"),
                ),
                Center(
                  child: Text("It's sunny here"),
                ),
                Center(
                  child: Text("It's sunny here1"),
                ),
              ],
            ),
          ),
        ));
  }
}
