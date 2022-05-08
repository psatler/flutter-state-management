// import 'package:graphql_flutter/graphql_flutter.dart';

// abstract class MappableClass {
//   fromMap(Map<String, dynamic> json);
// }

// QueryHookResult<T> useQueryWith<T extends MappableClass>(QueryOptions options) {
//   final result = useQuery(
//     QueryOptions(
//       document: options.document,
//       parserFn: (json) => T.fromMap(json),
//     ),
//   );

//   return result;
// }

// QueryHookResult<T> useQueryWith<T extends MappableClass>(QueryOptions options) {
//   final result = useQuery(
//     QueryOptions(
//       document: options.document,
//       cacheRereadPolicy: options.cacheRereadPolicy,
//       context: options.context,
//       errorPolicy: options.errorPolicy,
//       fetchPolicy: options.fetchPolicy,
//       operationName: options.operationName,
//       optimisticResult: options.optimisticResult,
//       pollInterval: options.pollInterval,
//       variables: options.variables,
//       parserFn: (json) => (T as MappableClass).fromMap(json),
//     ),
//   );

//   return result as QueryHookResult<T>;
// }





// class MyClass<T> {
//   final T Function() creator;
//   MyClass(this.creator);

//   T getGenericInstance() {
//     return creator();
//   }
// }

// class B {}

// final myClass = MyClass<B>(B.new);


// final queryResult = useQuery(
//       QueryOptions(
//         document: QUERY_SINGLE_COUNTRY,
//         variables: const {
//           "countryId": "AD",
//         },
//         parserFn: (json) => QuerySingleCountry.fromJson(json),
//       ),
//     );


// final result = useQueryWith<MyClass>(...);

// print(result.name)
