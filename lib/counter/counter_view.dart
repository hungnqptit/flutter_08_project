// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_08_project/counter/counter_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text("Reset"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
