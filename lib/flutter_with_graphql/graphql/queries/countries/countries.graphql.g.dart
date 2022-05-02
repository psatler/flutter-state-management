// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryListOfCountries _$QueryListOfCountriesFromJson(
        Map<String, dynamic> json) =>
    QueryListOfCountries(
      countries: (json['countries'] as List<dynamic>)
          .map((e) => QueryListOfCountries$countries.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$QueryListOfCountriesToJson(
        QueryListOfCountries instance) =>
    <String, dynamic>{
      'countries': instance.countries.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };

QueryListOfCountries$countries _$QueryListOfCountries$countriesFromJson(
        Map<String, dynamic> json) =>
    QueryListOfCountries$countries(
      code: json['code'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      capital: json['capital'] as String?,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$QueryListOfCountries$countriesToJson(
        QueryListOfCountries$countries instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'capital': instance.capital,
      '__typename': instance.$__typename,
    };
