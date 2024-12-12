import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/controller_counter.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  
  final counter = ControllerCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Mob X'),
      ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_){
              return Text(
                '${counter.number}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
