import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class HomeState extends Equatable {
  const HomeState.initialState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
