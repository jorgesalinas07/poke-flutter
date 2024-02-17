class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter += 1;
  }

  void reset() {
    _counter = 0;
  }

  void decrement() {
    if (_counter == 0) return;
    _counter -= 1;
  }
}
