import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase with _$ObservableListController;

abstract class ObservableListControllerBase with Store {

  @observable
  var products = <ProductModel>[].asObservable();


  @action
  void loadProducts(){
    products.addAll([
      ProductModel(name: "Telefone",),
      ProductModel(name: "Pente"),
      ProductModel(name: "Console"),
      ProductModel(name: "Mesa"),
    ]);
  }

  @action
  void addProduct(){
    products.add(ProductModel(name: "Telefone"));
  }

  @action
  void removeProduct(){
    products.removeAt(0);
  }

}