import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitapi/app/modules/counter/controller/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('COUNTER'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Value :'),
              Obx(
                () => Text(
                  '${c.count.value}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      c.increment();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      c.decrement();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text(
                      '-',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
