// import 'package:flutter/cupertino.dart';
//
// class NavigatorUtil {
//   static void pushPage(
//     BuildContext context,
//     Widget page, {
//     required String pageName,
//     bool needLogin = false,
//   }) {
//     if (context == null || page == null) return;
//     if (needLogin && !Util.isLogin()) {
//       pushPage(context, UserLoginPage(), pageName: '');
//       return;
//     }
//     Navigator.push(
//         context, new CupertinoPageRoute<void>(builder: (ctx) => page));
//   }
//
//   static void pushWeb(BuildContext context,
//       {String title, String titleId, String url, bool isHome: false}) {
//     if (context == null || ObjectUtil.isEmpty(url)) return;
//     if (url.endsWith(".apk")) {
//       launchInBrowser(url, title: title ?? titleId);
//     } else {
//       Navigator.push(
//           context,
//           new CupertinoPageRoute<void>(
//               builder: (ctx) => new WebScaffold(
//                     title: title,
//                     titleId: titleId,
//                     url: url,
//                   )));
//     }
//   }
//
//   static void pushTabPage(BuildContext context,
//       {String labelId, String title, String titleId, TreeModel treeModel}) {
//     if (context == null) return;
//     Navigator.push(
//         context,
//         new CupertinoPageRoute<void>(
//             builder: (ctx) => new BlocProvider<TabBloc>(
//                   child: new TabPage(
//                     labelId: labelId,
//                     title: title,
//                     titleId: titleId,
//                     treeModel: treeModel,
//                   ),
//                   bloc: new TabBloc(),
//                 )));
//   }
//
//   static Future<Null> launchInBrowser(String url, {String title}) async {
//     if (await canLaunch(url)) {
//       await launch(url, forceSafariVC: false, forceWebView: false);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
