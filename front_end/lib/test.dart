import 'dart:ffi';
import 'dart:math';

int a = Random().nextInt(6);
void main(List<String> args) {
  for (int i = 0; i < 20; i++) {
    a = Random().nextInt(6);
    print(a);
  }
}
