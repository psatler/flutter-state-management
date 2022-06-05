import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'countries.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$ListOfCountries {
  Query$ListOfCountries({required this.countries, required this.$__typename});

  @override
  factory Query$ListOfCountries.fromJson(Map<String, dynamic> json) =>
      _$Query$ListOfCountriesFromJson(json);

  final List<Query$ListOfCountries$countries> countries;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$ListOfCountriesToJson(this);
  int get hashCode {
    final l$countries = countries;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$countries.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ListOfCountries) || runtimeType != other.runtimeType)
      return false;
    final l$countries = countries;
    final lOther$countries = other.countries;
    if (l$countries.length != lOther$countries.length) return false;
    for (int i = 0; i < l$countries.length; i++) {
      final l$countries$entry = l$countries[i];
      final lOther$countries$entry = lOther$countries[i];
      if (l$countries$entry != lOther$countries$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$ListOfCountries on Query$ListOfCountries {
  Query$ListOfCountries copyWith(
          {List<Query$ListOfCountries$countries>? countries,
          String? $__typename}) =>
      Query$ListOfCountries(
          countries: countries == null ? this.countries : countries,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentListOfCountries = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListOfCountries'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'countries'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'phone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'capital'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$ListOfCountries _parserFn$Query$ListOfCountries(
        Map<String, dynamic> data) =>
    Query$ListOfCountries.fromJson(data);

class Options$Query$ListOfCountries
    extends graphql.QueryOptions<Query$ListOfCountries> {
  Options$Query$ListOfCountries(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentListOfCountries,
            parserFn: _parserFn$Query$ListOfCountries);
}

class WatchOptions$Query$ListOfCountries
    extends graphql.WatchQueryOptions<Query$ListOfCountries> {
  WatchOptions$Query$ListOfCountries(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentListOfCountries,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$ListOfCountries);
}

class FetchMoreOptions$Query$ListOfCountries extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListOfCountries(
      {required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: queryDocumentListOfCountries);
}

extension ClientExtension$Query$ListOfCountries on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListOfCountries>> query$ListOfCountries(
          [Options$Query$ListOfCountries? options]) async =>
      await this.query(options ?? Options$Query$ListOfCountries());
  graphql.ObservableQuery<Query$ListOfCountries> watchQuery$ListOfCountries(
          [WatchOptions$Query$ListOfCountries? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$ListOfCountries());
  void writeQuery$ListOfCountries(
          {required Query$ListOfCountries data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: queryDocumentListOfCountries)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$ListOfCountries? readQuery$ListOfCountries({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: queryDocumentListOfCountries)),
        optimistic: optimistic);
    return result == null ? null : Query$ListOfCountries.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListOfCountries> useQuery$ListOfCountries(
        [Options$Query$ListOfCountries? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$ListOfCountries());
graphql.ObservableQuery<Query$ListOfCountries> useWatchQuery$ListOfCountries(
        [WatchOptions$Query$ListOfCountries? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$ListOfCountries());

class Query$ListOfCountries$Widget
    extends graphql_flutter.Query<Query$ListOfCountries> {
  Query$ListOfCountries$Widget(
      {widgets.Key? key,
      Options$Query$ListOfCountries? options,
      required graphql_flutter.QueryBuilder<Query$ListOfCountries> builder})
      : super(
            key: key,
            options: options ?? Options$Query$ListOfCountries(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$ListOfCountries$countries {
  Query$ListOfCountries$countries(
      {required this.code,
      required this.name,
      required this.phone,
      this.capital,
      required this.$__typename});

  @override
  factory Query$ListOfCountries$countries.fromJson(Map<String, dynamic> json) =>
      _$Query$ListOfCountries$countriesFromJson(json);

  final String code;

  final String name;

  final String phone;

  final String? capital;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$ListOfCountries$countriesToJson(this);
  int get hashCode {
    final l$code = code;
    final l$name = name;
    final l$phone = phone;
    final l$capital = capital;
    final l$$__typename = $__typename;
    return Object.hashAll([l$code, l$name, l$phone, l$capital, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ListOfCountries$countries) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$capital = capital;
    final lOther$capital = other.capital;
    if (l$capital != lOther$capital) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$ListOfCountries$countries
    on Query$ListOfCountries$countries {
  Query$ListOfCountries$countries copyWith(
          {String? code,
          String? name,
          String? phone,
          String? Function()? capital,
          String? $__typename}) =>
      Query$ListOfCountries$countries(
          code: code == null ? this.code : code,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          capital: capital == null ? this.capital : capital(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
