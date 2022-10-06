import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String loginPage = '/login';
  static String gamepannelPage = '/gamepannel';

  static void configureRoutes(fluro.Router router) {
    router.notFoundHandler = new fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return Text('Page not found');
    });

    // 创建pageRoute
    router.define(loginPage, handler: loginPageHandler);
    router.define(gamepannelPage, handler: gamepannelHandler);
  }
}
