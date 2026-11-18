import 'dart:async';

class CounterController {
  int count = 0;
  final controller = StreamController<int>();
  Stream<int> get stream => controller.stream;

  void increment(){
    count++;
    controller.sink.add(count);
  }

  void decrement(){
    count--;
    controller.sink.add(count);
  }

  void dispose(){
    controller.close();
  }
}