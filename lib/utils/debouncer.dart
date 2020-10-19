import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer _timer;

  Debouncer({this.delay});

  run(Function action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(delay, action);
  }
}
