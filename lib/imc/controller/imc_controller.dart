import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = ImcControllerBase with _$ImcController;

abstract class ImcControllerBase with Store {

  @observable
  double imc = 0.0;

  @observable
  String? error;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> calculateImc({required double weight,required double height}) async {
    try {
  imc = 0.0;
  error = null;
  await Future.delayed(const Duration(seconds: 1));
  imc = weight / (height * 2);
} catch (e) {
  error = 'Error calculating IMC';
}
  }
}