import 'package:pokemon_app/model/counter_model.dart';

class CounterViewModel {
  final CounterModel _counterModel = CounterModel();

  int get counter => _counterModel.counter;

  void increment() {
    _counterModel.increment();
  }

  void reset() {
    _counterModel.reset();
  }

  void decrement() {
    _counterModel.decrement();
  }
}
