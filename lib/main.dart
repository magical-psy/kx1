import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_gorgeous_login/pages/login_page/pages/login_page.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'config/routers/router_application.dart';
import 'config/routers/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = fluro.Router();
    ApplicationRouter.router = router;
    // 完成路由全局配置和路由定义
    Routes.configureRoutes(router);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'remember to name it',
      home: LoginPage(),
    );
  }
}
