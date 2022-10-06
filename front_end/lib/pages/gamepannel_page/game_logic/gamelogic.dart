import 'dart:io';

class MatContent {
  List<int> mat = [];
  int point = 0;
  MatContent() {
    for (int i = 0; i < 9; i++) {
      mat.add(i);
    }
  }

  updatePoint() {
    point = 0;
    for (int i = 0; i < 3; i++) {
      List<int> count = [mat[i], mat[3 + i], mat[6 + i]];
      count.sort();
      if (count[0] == count[1]) {
        //all of the three
        if (count[1] == count[2]) {
          point += 9 * count[0];
        }
        //the first two equals
        else {
          point += (4 * count[0] + count[2]);
        }
      }
      //the last two
      else if (mat[1] == mat[2]) {
        point += (count[0] + 4 * count[1]);
      }
      //just three nums
      else {
        point += (count[0] + count[1] + count[2]);
      }
    }
  }

  showmat() {
    for (int i = 0; i < 9; i++) {
      stdout.write(mat[i]);
      stdout.write("  ");
      if (i % 3 == 2) {
        print("\n");
      }
    }
    print("the final score=$point");
  }

  move(int x, int y, int value) {
    mat[3 * x + y] = value;
    updatePoint();
  }

  clear(int column, int value) {
    for (int i = column; i < 9; i += 3) {
      mat[i] == value ? mat[i] = 0 : mat[i] = mat[i];
    }
    updatePoint();
  }
}
