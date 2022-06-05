import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'country.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$SingleCountry {
  Variables$Query$SingleCountry({required this.countryId});

  @override
  factory Variables$Query$SingleCountry.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$SingleCountryFromJson(json);

  final String countryId;

  Map<String, dynamic> toJson() => _$Variables$Query$SingleCountryToJson(this);
  int get hashCode {
    final l$countryId = countryId;
    return Object.hashAll([l$countryId]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$SingleCountry) ||
        runtimeType != other.runtimeType) return false;
    final l$countryId = countryId;
    final lOther$countryId = other.countryId;
    if (l$countryId != lOther$countryId) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Query$SingleCountry {
  Query$SingleCountry({this.country, required this.$__typename});

  @override
  factory Query$SingleCountry.fromJson(Map<String, dynamic> json) =>
      _$Query$SingleCountryFromJson(json);

  final Query$SingleCountry$country? country;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$SingleCountryToJson(this);
  int get hashCode {
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([l$country, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$SingleCountry) || runtimeType != other.runtimeType)
      return false;
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$SingleCountry on Query$SingleCountry {
  Query$SingleCountry copyWith(
          {Query$SingleCountry$country? Function()? country,
          String? $__typename}) =>
      Query$SingleCountry(
          country: country == null ? this.country : country(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentSingleCountry = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SingleCountry'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'countryId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'country'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'code'),
                  value: VariableNode(name: NameNode(value: 'countryId')))
            ],
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
Query$SingleCountry _parserFn$Query$SingleCountry(Map<String, dynamic> data) =>
    Query$SingleCountry.fromJson(data);

class Options$Query$SingleCountry
    extends graphql.QueryOptions<Query$SingleCountry> {
  Options$Query$SingleCountry(
      {String? operationName,
      required Variables$Query$SingleCountry variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentSingleCountry,
            parserFn: _parserFn$Query$SingleCountry);
}

class WatchOptions$Query$SingleCountry
    extends graphql.WatchQueryOptions<Query$SingleCountry> {
  WatchOptions$Query$SingleCountry(
      {String? operationName,
      required Variables$Query$SingleCountry variables,
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
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentSingleCountry,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$SingleCountry);
}

class FetchMoreOptions$Query$SingleCountry extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SingleCountry(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$SingleCountry variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: queryDocumentSingleCountry);
}

extension ClientExtension$Query$SingleCountry on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SingleCountry>> query$SingleCountry(
          Options$Query$SingleCountry options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$SingleCountry> watchQuery$SingleCountry(
          WatchOptions$Query$SingleCountry options) =>
      this.watchQuery(options);
  void writeQuery$SingleCountry(
          {required Query$SingleCountry data,
          required Variables$Query$SingleCountry variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: queryDocumentSingleCountry),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$SingleCountry? readQuery$SingleCountry(
      {required Variables$Query$SingleCountry variables,
      bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentSingleCountry),
            variables: variables.toJson()),
        optimistic: optimistic);
    return result == null ? null : Query$SingleCountry.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SingleCountry> useQuery$SingleCountry(
        Options$Query$SingleCountry options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SingleCountry> useWatchQuery$SingleCountry(
        WatchOptions$Query$SingleCountry options) =>
    graphql_flutter.useWatchQuery(options);

class Query$SingleCountry$Widget
    extends graphql_flutter.Query<Query$SingleCountry> {
  Query$SingleCountry$Widget(
      {widgets.Key? key,
      required Options$Query$SingleCountry options,
      required graphql_flutter.QueryBuilder<Query$SingleCountry> builder})
      : super(key: key, options: options, builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$SingleCountry$country {
  Query$SingleCountry$country(
      {required this.code,
      required this.name,
      required this.phone,
      this.capital,
      required this.$__typename});

  @override
  factory Query$SingleCountry$country.fromJson(Map<String, dynamic> json) =>
      _$Query$SingleCountry$countryFromJson(json);

  final String code;

  final String name;

  final String phone;

  final String? capital;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$SingleCountry$countryToJson(this);
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
    if (!(other is Query$SingleCountry$country) ||
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

extension UtilityExtension$Query$SingleCountry$country
    on Query$SingleCountry$country {
  Query$SingleCountry$country copyWith(
          {String? code,
          String? name,
          String? phone,
          String? Function()? capital,
          String? $__typename}) =>
      Query$SingleCountry$country(
          code: code == null ? this.code : code,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          capital: capital == null ? this.capital : capital(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
