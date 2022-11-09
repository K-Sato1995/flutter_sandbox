// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    @Default(0) int count,
  }) = _Counter;

  factory Counter.fromJson(Map<String, Object?> json) =>
      _$CounterFromJson(json);
}
