import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/future/future_controller.dart';

class FuturePage extends StatefulWidget {

  FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final controller = FutureController();

  @override
  void initState() {
    super.initState();
    controller.getnameFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Observer(
          builder: (_) {
              return FutureBuilder<String>(
              future: controller.nameFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
      
                    return const SizedBox.shrink();
      
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const CircularProgressIndicator();
      
                  case ConnectionState.done:
                    
                    if (snapshot.hasError) {
                      return const Center(child: Text('Nome não encontrado!'));
                    }
                    return Center(child: Text(snapshot.data!));
                  
                }
              },
            );
          },
      )
    );
  }
}
