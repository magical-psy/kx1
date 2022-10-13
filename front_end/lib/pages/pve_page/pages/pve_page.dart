import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_gorgeous_login/pages/pve_page/moduels/pannel.dart';
import 'package:the_gorgeous_login/pages/pve_page/provider/PvEprovider.dart';

class PvEPage extends StatefulWidget {
  const PvEPage({Key key}) : super(key: key);
  @override
  _PvPPageState createState() => _PvPPageState();
}

class _PvPPageState extends State<PvEPage> {
  int first = 1;
  bool check() {
    if (first == 1) {
      first = 0;
      return false;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    final gamedata = Provider.of<PvEData>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
            elevation: 2.0,
            backgroundColor: Color.fromRGBO(135, 206, 250, 1),
            title: Container(child: Consumer<PvEData>(
              builder: (context, gamedata, _) {
                return Text(
                  "挑战模式",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontFamily: 'WorkSansBold'),
                );
              },
            )),
            leading: MaterialButton(
              shape: StadiumBorder(side: BorderSide.none),
              child: Icon(Icons.arrow_back_ios),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('提示'),
                        content: Text('确定要离开？'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop('cancel');
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('离开'),
                            onPressed: () {
                              gamedata.reset(context);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              // ApplicationRouter.router
                              //     .navigateTo(context, '/mode', replace: true);
                            },
                          ),
                        ],
                      );
                    });
              },
            )),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/img/mode.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(200, 200, 200, 0.3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<PvEData>(builder: (context, gamedata, _) {
                      return Text(
                        "point\n${gamedata.uppoint}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'WorkSansBold'),
                      );
                    }),
                    Consumer<PvEData>(builder: (context, gamedata, _) {
                      return Text(
                        "point\n${gamedata.downpoint}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'WorkSansBold'),
                      );
                    })
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Pannelai(), Pannel(position: 1), get_move()],
              ),
            ),
          ]),
        ));
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
            child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 1 / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.green],
                  ),
                ),
                child: Text(
                  " 掷骰子 ",
                  style: TextStyle(color: Colors.white),
                )),
            onPressed: () {
              final data = Provider.of<PvEData>(context, listen: false);
              data.getnum();
            }),
        NumSource()
      ],
    );
  }
}
