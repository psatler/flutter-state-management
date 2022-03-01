import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class BaseObject {
  final String id;
  final String lastUpdated;

  BaseObject()
      : id = const Uuid().v4(),
        lastUpdated = DateTime.now().toIso8601String();

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is BaseObject &&
  //     other.id == id &&
  //     other.lastUpdated == lastUpdated;
  // }

  @override
  bool operator ==(covariant BaseObject other) => id == other.id;

  @override
  int get hashCode => id.hashCode;

  // @override
  // int get hashCode => id.hashCode ^ lastUpdated.hashCode;
}

@immutable
class ExpensiveObject extends BaseObject {}

@immutable
class CheapObject extends BaseObject {}
