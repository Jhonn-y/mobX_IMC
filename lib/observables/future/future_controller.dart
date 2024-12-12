import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {

  @observable
  var nameFuture = ObservableFuture.value('');


  @action
  Future<void> getnameFuture() async {
    nameFuture = Future.delayed(const Duration(seconds: 1), () => "Nome no futuro").asObservable();
  }

}