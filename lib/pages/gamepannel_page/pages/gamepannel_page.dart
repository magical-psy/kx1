import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/pages/gamepannel_page/moduels/pannel.dart';

class GamepannelPage extends StatefulWidget {
  const GamepannelPage({Key key}) : super(key: key);
  @override
  _GamepannelPageState createState() => _GamepannelPageState();
}

class _GamepannelPageState extends State<GamepannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('undetermined',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0)),
          actions: <Widget>[],
        ),
        body: Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFfbab66),
                    Colors.pinkAccent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontFamily: 'WorkSansBold'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Pannel(),
                Container(
                  child: Image(
                      height:
                          MediaQuery.of(context).size.height > 800 ? 111.0 : 70,
                      fit: BoxFit.fill,
                      image: const AssetImage('assets/img/login_logo.png')),
                ),
                Pannel()
              ],
            ),
          ),
        ]));
  }
}
