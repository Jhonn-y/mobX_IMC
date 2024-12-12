// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:mobx_imc/model/product_model.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {

  @observable
  ProductModel model;

  @observable
  bool selected;
  ProductStoreBase({
    required this.model,
    required this.selected,
  });

}
