import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_gorgeous_login/config/routers/router_application.dart';
import 'package:the_gorgeous_login/pages/pvp_page/moduels/pannel.dart';
import 'package:the_gorgeous_login/pages/pvp_page/provider/PvPprovider.dart';

class PvEPage extends StatefulWidget {
  const PvEPage({Key key}) : super(key: key);
  @override
  _PvEPageState createState() => _PvEPageState();
}

class _PvEPageState extends State<PvEPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 2.0,
            backgroundColor: Colors.white,
            title: Text('pvepage',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0)),
            leading: OutlinedButton(
              child: Text('leave'),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('hint'),
                        content: Text('are you sure about it'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('cancel'),
                            onPressed: () {
                              Navigator.of(context).pop('cancel');
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('leave'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              ApplicationRouter.router
                                  .navigateTo(context, '/login');
                            },
                          ),
                        ],
                      );
                    });
              },
            )),
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
                  Container(child: Consumer<PvPData>(
                    builder: (context, gamedata, _) {
                      return Text(
                        gamedata.turn == 0 ? "Opponent's Round" : "Your Turn",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold'),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.height * 0.1,
                            fit: BoxFit.fill,
                            image: const AssetImage('assets/img/p1.JPG')),
                        Text("くりやま みらい"),
                        Consumer<PvPData>(builder: (context, gamedata, _) {
                          return Text("point:\n${gamedata.uppoint}");
                        })
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.height * 0.1,
                            fit: BoxFit.fill,
                            image: const AssetImage('assets/img/p2.JPG')),
                        Text("Princess Zelda"),
                        Consumer<PvPData>(builder: (context, gamedata, _) {
                          return Text("point:\n${gamedata.downpoint}");
                        })
                      ],
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
                Pannel(
                  position: 0,
                ),
                Container(
                  child: Image(
                      height:
                          MediaQuery.of(context).size.height > 800 ? 111.0 : 70,
                      fit: BoxFit.fill,
                      image: const AssetImage('assets/img/login_logo.png')),
                ),
                Pannel(position: 1),
                get_move()
              ],
            ),
          ),
        ]));
  }
}

class get_move extends StatefulWidget {
  get_move({Key key}) : super(key: key);

  @override
  State<get_move> createState() => _get_moveState();
}

class _get_moveState extends State<get_move> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
            child: Text("get a redom num"),
            onPressed: () {
              final data = Provider.of<PvPData>(context, listen: false);
              data.getnum();
            }),
        NumSource()
      ],
    );
  }
}
