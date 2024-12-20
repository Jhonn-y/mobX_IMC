import 'package:flutter/material.dart';
import 'package:mobx_imc/observables/observable_model/observable_model_page.dart';
// import 'package:mobx_imc/contador/counter_page.dart';
// import 'package:mobx_imc/contador_codegen/counter_codegen_page.dart';
// import 'package:mobx_imc/imc/imc_page.dart';
// import 'package:mobx_imc/observables/list/observable_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ObservableModelPage(),
    );
  }
}
