part of '../auth_cubit.dart';

@immutable
abstract class EditionsForSelectState extends AuthState {}

class EditionsForSelectInitial extends EditionsForSelectState {}

class EditionsForSelectSuccess extends EditionsForSelectState {
  EditionsForSelectSuccess(this.model);
  final EditionsForSelectModel model;
}

class EditionsForSelectLoading extends EditionsForSelectState {}

class EditionsForSelectFail extends EditionsForSelectState {
  EditionsForSelectFail(this.error);

  final String error;
}
