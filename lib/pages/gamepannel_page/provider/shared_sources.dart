import 'dart:math';

import 'package:flutter/material.dart';

class GameData with ChangeNotifier {
  int randomNum = 0;
  List<int> updata = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> downdata = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  int get getNum => randomNum;
  List<int> get upMat => updata;
  List<int> get downMat => downdata;

  void getnum() {
    randomNum = Random().nextInt(6) + 1;
    notifyListeners();
    print(randomNum);
  }

  void updatemat(int sign, List<int> newmat) {
    if (sign == 0) {
      updata = newmat;
    } else {
      downdata = newmat;
    }
    notifyListeners();
    print("after the move the mat has been changed like this");
    print("up$updata");
    print("down$downdata");
  }
}
