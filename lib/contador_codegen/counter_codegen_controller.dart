import 'package:mobx/mobx.dart';

part 'counter_codegen_controller.g.dart';

class CounterCodegenController = _CounterCodegenControllerBase with _$CounterCodegenController;



abstract class _CounterCodegenControllerBase with Store{
  
  @observable
  int number = 0;

  @action
  void increment() {
    number++;
  }

}