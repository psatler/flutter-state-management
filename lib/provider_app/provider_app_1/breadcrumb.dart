import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Breadcrumb {
  bool isActive;
  final String name;
  final String uuid;

  Breadcrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
  }

  String get title => name + (isActive ? ' > ' : '');

  @override
  bool operator ==(covariant Breadcrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  @override
  String toString() =>
      'Breadcrumb(isActive: $isActive, name: $name, uuid: $uuid)';
}

class BreadcrumbProvider extends ChangeNotifier {
  final List<Breadcrumb> _items = [];
  UnmodifiableListView<Breadcrumb> get items => UnmodifiableListView(_items);

  void add(Breadcrumb breadcrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadcrumb);

    notifyListeners();
  }

  void reset() {
    _items.clear();

    notifyListeners();
  }
}
