import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc/person.dart';

// ignore: slash_for_doc_comments
/**
 * [
      {
        "name": "Foo3",
        "age": 32
      },
      {
        "name": "Foo4",
        "age": 12
      }
    ]
 */

// enum PersonUrl {
//   person1('person1'),
//   person2('person2');

//   final String name;
//   const PersonUrl(this.name);

//   String get urlString {
//     switch (this) {
//       case PersonUrl.person1:
//         return 'https://mocki.io/v1/94cf5c4d-cc1e-4cf7-b954-c76dd9472020';
//       case PersonUrl.person2:
//         return 'https://mocki.io/v1/05bbe37d-937e-425e-b383-6e3f0de60095';
//     }
//   }
// }

const personUrl1 = 'https://mocki.io/v1/94cf5c4d-cc1e-4cf7-b954-c76dd9472020';
const personUrl2 = 'https://mocki.io/v1/05bbe37d-937e-425e-b383-6e3f0de60095';

typedef PersonsLoader = Future<Iterable<Person>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  // final PersonUrl personUrl;
  final String personUrl;
  final PersonsLoader loader;

  const LoadPersonsAction(this.personUrl, this.loader);
}
