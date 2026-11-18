import 'package:bloc_a/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final counter = CounterController();
  @override
  void dispose() {
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: counter.stream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  "Count: ${snapshot.data}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counter.increment,
                  child: Text("Increment"),
                ),

                SizedBox(width: 15),

                ElevatedButton(
                  onPressed: counter.decrement,
                  child: Text("Decrement"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
