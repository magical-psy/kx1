import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:the_gorgeous_login/pages/gamemode_page/choosemode.dart';
import 'package:the_gorgeous_login/pages/login_page/pages/login_page.dart';
import 'package:the_gorgeous_login/pages/pvp_page/pages/gamepannel_page.dart';

Handler loginPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
});

Handler gamepannelHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return GamepannelPage();
});

Handler modeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return chooseModePage();
});
