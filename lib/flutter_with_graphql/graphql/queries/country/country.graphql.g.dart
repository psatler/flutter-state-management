// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariablesQuerySingleCountry _$VariablesQuerySingleCountryFromJson(
        Map<String, dynamic> json) =>
    VariablesQuerySingleCountry(
      countryId: json['countryId'] as String,
    );

Map<String, dynamic> _$VariablesQuerySingleCountryToJson(
        VariablesQuerySingleCountry instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
    };

QuerySingleCountry _$QuerySingleCountryFromJson(Map<String, dynamic> json) =>
    QuerySingleCountry(
      country: json['country'] == null
          ? null
          : QuerySingleCountry$country.fromJson(
              json['country'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$QuerySingleCountryToJson(QuerySingleCountry instance) =>
    <String, dynamic>{
      'country': instance.country?.toJson(),
      '__typename': instance.$__typename,
    };

QuerySingleCountry$country _$QuerySingleCountry$countryFromJson(
        Map<String, dynamic> json) =>
    QuerySingleCountry$country(
      code: json['code'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      capital: json['capital'] as String?,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$QuerySingleCountry$countryToJson(
        QuerySingleCountry$country instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'capital': instance.capital,
      '__typename': instance.$__typename,
    };
