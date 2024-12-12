import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/counter_codegen_controller.dart';

class CounterCodegenPage extends StatefulWidget {
  const CounterCodegenPage({super.key});

  @override
  State<CounterCodegenPage> createState() => _CounterCodegenPageState();
}

class _CounterCodegenPageState extends State<CounterCodegenPage> {
  final counter = CounterCodegenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final autoRunDispose = autorun(
      (_){
        print('----------------------- autorun --------------------');
      }
    );
  final reactionDispose = reaction((_)=> counter.number, (number){
    print('----------------------- reaction --------------------');
    print(number); 
  });

  reactionDisposer.add(reactionDispose);
  reactionDisposer.add(autoRunDispose);
  }


  @override
  void dispose() {
    super.dispose();
    for (var reaction in reactionDisposer) {
      reaction();
    }
  }


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
