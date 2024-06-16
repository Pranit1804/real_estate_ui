import 'dart:async';

class NavStream {
  static StreamController<int> navStream = StreamController<int>.broadcast();

  static Stream<int> get stream => navStream.stream;

  static void pushData(int value) {
    navStream.add(value);
  }

  static void close() {
    navStream.close();
  }
}
