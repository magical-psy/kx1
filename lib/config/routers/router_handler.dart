import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:the_gorgeous_login/pages/gamepannel_page/pages/gamepannel_page.dart';
import 'package:the_gorgeous_login/pages/login_page/pages/login_page.dart';

// 商品详情
Handler loginPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
});

// 订单支付
Handler gamepannelHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return GamepannelPage();
});
