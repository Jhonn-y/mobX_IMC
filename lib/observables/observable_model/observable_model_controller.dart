import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
import 'package:mobx_imc/observables/observable_model/model/product_store.dart';
part 'observable_model_controller.g.dart';

class ObservableModelController = ObservableModelControllerBase with _$ObservableModelController;

abstract class ObservableModelControllerBase with Store {

  @observable
  var products = <ProductStore>[].asObservable();


  @action
  void loadProducts(){
    products.addAll([
      ProductStore(model: ProductModel(name: "Telefone"),selected: false),
      ProductStore(model: ProductModel(name: "Pente"),selected: false),
      ProductStore(model: ProductModel(name: "Console"),selected: false),
      ProductStore(model: ProductModel(name: "Mesa"),selected: false),
    ]);
  }

  @action
  void addProduct(){
    products.add(ProductStore(model: ProductModel(name: "Telefone"),selected: false),);
  }

  @action
  void removeProduct(){
    products.removeAt(0);
  }

  @action
  void selectProduct(int index){
    var isSelected = products[index].selected;
    products[index].selected =!isSelected;
  }

}