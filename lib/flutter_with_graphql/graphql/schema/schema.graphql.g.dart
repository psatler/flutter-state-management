// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputStringQueryOperatorInput _$InputStringQueryOperatorInputFromJson(
        Map<String, dynamic> json) =>
    InputStringQueryOperatorInput(
      eq: json['eq'] as String?,
      ne: json['ne'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      nin: (json['nin'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      regex: json['regex'] as String?,
      glob: json['glob'] as String?,
    );

Map<String, dynamic> _$InputStringQueryOperatorInputToJson(
        InputStringQueryOperatorInput instance) =>
    <String, dynamic>{
      'eq': instance.eq,
      'ne': instance.ne,
      'in': instance.$in,
      'nin': instance.nin,
      'regex': instance.regex,
      'glob': instance.glob,
    };

InputCountryFilterInput _$InputCountryFilterInputFromJson(
        Map<String, dynamic> json) =>
    InputCountryFilterInput(
      code: json['code'] == null
          ? null
          : InputStringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : InputStringQueryOperatorInput.fromJson(
              json['currency'] as Map<String, dynamic>),
      continent: json['continent'] == null
          ? null
          : InputStringQueryOperatorInput.fromJson(
              json['continent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InputCountryFilterInputToJson(
        InputCountryFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
      'currency': instance.currency?.toJson(),
      'continent': instance.continent?.toJson(),
    };

InputContinentFilterInput _$InputContinentFilterInputFromJson(
        Map<String, dynamic> json) =>
    InputContinentFilterInput(
      code: json['code'] == null
          ? null
          : InputStringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InputContinentFilterInputToJson(
        InputContinentFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
    };

InputLanguageFilterInput _$InputLanguageFilterInputFromJson(
        Map<String, dynamic> json) =>
    InputLanguageFilterInput(
      code: json['code'] == null
          ? null
          : InputStringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InputLanguageFilterInputToJson(
        InputLanguageFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
    };
