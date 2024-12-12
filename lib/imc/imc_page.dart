// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/imc/controller/imc_controller.dart';
import 'package:mobx_imc/widgets/imc_gauge.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final heightEC = TextEditingController();

  final weightEC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  final controller = ImcController();

  final listDispose = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    
    final reactionDispose = reaction<bool>((_) => controller.hasError,(hasError) => 
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(controller.error?? 'ERRO'))));

    listDispose.add(reactionDispose);
  }

  @override
  void dispose() {
    heightEC.dispose();
    weightEC.dispose();
    super.dispose();
    for (var reactionDisposer in listDispose) {
      reactionDisposer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return ImcGauge(imc: controller.imc);
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: heightEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura (m)',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatótio!';
                    }
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt-BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                ),
                TextFormField(
                    controller: weightEC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso (Kg)',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatótio!';
                      }
                    },
                    inputFormatters: [
                      CurrencyTextInputFormatter.currency(
                        locale: 'pt-BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true,
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValidate =
                        formkey.currentState?.validate() ?? false;

                    if (formValidate) {
                      var formatter = NumberFormat.simpleCurrency(
                        locale: 'pt-BR',
                        decimalDigits: 2,
                      );
                      double height = formatter.parse(heightEC.text) as double;
                      double weight = formatter.parse(weightEC.text) as double;

                      controller.calculateImc(height: height, weight: weight);
                    }
                  },
                  child: Text("Calcular IMC"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
