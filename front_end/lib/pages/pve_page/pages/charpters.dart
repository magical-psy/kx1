import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_gorgeous_login/config/routers/router_application.dart';
import 'package:the_gorgeous_login/config/theme.dart';
import 'package:the_gorgeous_login/pages/pve_page/provider/PvEprovider.dart';

class chapter extends StatefulWidget {
  chapter({Key key}) : super(key: key);

  @override
  State<chapter> createState() => _chapterState();
}

class _chapterState extends State<chapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择关卡"),
        elevation: 2.0,
        backgroundColor: Color.fromRGBO(135, 206, 250, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                CustomTheme.loginGradientStart,
                CustomTheme.loginGradientEnd
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: <double>[0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/1.png')),
                          )),
                      Text("第一关")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/0.png')),
                          )),
                      Text("第二关")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/2.png')),
                          )),
                      Text("第三关")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/3.png')),
                          )),
                      Text("第四关")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/4.png')),
                          )),
                      Text("第五关")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {
                              ApplicationRouter.router
                                  .navigateTo(context, '/pve');

                              final data =
                                  Provider.of<PvEData>(context, listen: false);
                              data.reset(context);
                              data.turn = 1;
                            },
                            child: Image(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/img/5.png')),
                          )),
                      Text("第六关")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
