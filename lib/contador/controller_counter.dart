
import 'package:mobx/mobx.dart';

class ControllerCounter {
  
  var _counter = Observable<int>(0);
  late Action increment;

  ControllerCounter(){
    increment = Action(_increment);
  }
  
  int get number => _counter.value;

  void _increment() {
    _counter.value ++;

  }
}