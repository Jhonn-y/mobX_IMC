import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/observable_model/observable_model_controller.dart';

class ObservableModelPage extends StatefulWidget {

  const ObservableModelPage({ super.key });

  @override
  State<ObservableModelPage> createState() => _ObservableModelPageState();
}

class _ObservableModelPageState extends State<ObservableModelPage> {

  final controller = ObservableModelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable Model'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                final product = controller.products[index];
                  return Observer(
                    builder: (_) => CheckboxListTile(value: product.selected, onChanged: (_) {
                      controller.selectProduct(index);
                    },
                    title: Text(product.model.name),),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                controller.addProduct();
              }, child: const Text('Adicionar')),
              TextButton(onPressed: () {
                controller.removeProduct();
              }, child: const Text('Remover')),
              TextButton(onPressed: () {
                controller.loadProducts();
              }, child: const Text('Carregar')),
            ],
          )
        ],
      ),
    );
  }
}