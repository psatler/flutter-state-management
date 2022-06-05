import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

mixin CanRun {
  int get speed;

  void run() {
    "Running at the speed of $speed".log();
  }
}

class Cat with CanRun {
  @override
  int speed = 10;
}

// ##############################################################################
// Constraining the mixin to be used only on Animal type of classes
// first, creating an abstract class
abstract class Animal {
  const Animal();
}

// this mixin will constrain our mixin to be used only on Animal types
mixin CanRun2 on Animal {
  int get speed;

  void run() {
    "CanRun2: Running at the speed of $speed".log();
  }
}

class Cat2 extends Animal with CanRun2 {
  @override
  int speed = 10;
}

// ##############################################################################
// ### Mixins with extensions are very powerful ###
extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) =>
      HttpClient().getUrl(Uri.parse(url)).then((req) => req.close());
}

mixin CanMakeGetCall {
  String get url;

  @useResult // marker from package meta to make sure we use the result of this method
  Future<String> getString() {
    // as there is the extension "GetOnUri" on Object and a mixin is at on Object as well, we can straight use it here

    return getUrl(url)
        .then((response) => response.transform(utf8.decoder).join());
  }
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();

  @override
  String get url => "https://jsonplaceholder.typicode.com/users/2";
}

void testItMixins() async {
  final cat = Cat();

  cat.run();
  cat.speed = 20;
  cat.run();

  // ##############################################################################
  final people = await const GetPeople().getString();
  people.log();
}
