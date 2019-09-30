import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CountBLocCopy{
  int _count = 5;
  var _subject = BehaviorSubject<int>();

  Stream<int> get stream => _subject.stream;
  int get value => _count;

  void decreament() => _subject.add(--_count);

  void dispose() {
    _subject.close();
  }
}
