import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

@immutable
class Person {
  final String id;
  final String name;
  final int age;
  final String imageUrl;

  final Uint8List? imageData;
  final bool isLoading;

  const Person({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.imageData,
    required this.isLoading,
  });

  Person copiedWith([
    bool? isLoading,
    Uint8List? imageData,
  ]) =>
      Person(
        id: id,
        name: name,
        age: age,
        imageUrl: imageUrl,
        imageData: imageData ?? this.imageData,
        isLoading: isLoading ?? this.isLoading,
      );

  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        imageUrl = json['imageUrl'] as String,
        name = json['name'] as String,
        age = json['age'] as int,
        imageData = null,
        isLoading = false;

  @override
  String toString() {
    return 'Person (id = $id, $name, $age years old)';
  }
}
