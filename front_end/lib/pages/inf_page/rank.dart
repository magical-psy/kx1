import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/config/theme.dart';

class rank extends StatelessWidget {
  rank({Key key}) : super(key: key);

  List<Widget> rl = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("牛爷爷"), Text("78胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("白眼果蝇"), Text("72胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("黑眼果蝇"), Text("32胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("BIN神的亲爹"), Text("31胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("红眼果蝇"), Text("29胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("绿眼果蝇"), Text("28胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("三眼果蝇"), Text("23胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("BIN神的亲爷爷"), Text("20胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("原p真恶心"), Text("16胜")],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text("彩虹果蝇▪光之守护者"), Text("10胜")],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(135, 206, 250, 1),
          title: Text("排行榜"),
        ),
        body: Container(
          decoration: BoxDecoration(
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
          child: ListView.builder(
              itemCount: 10,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return rl[index];
              }),
        ));
  }
}
