part of '../auth_cubit.dart';

@immutable
abstract class CurrentLoginInfoState extends AuthState {}

class CurrentLoginInfoInitial extends CurrentLoginInfoState {}

class CurrentLoginInfoSuccess extends CurrentLoginInfoState {
  CurrentLoginInfoSuccess(this.loginInfo);
  final LoginInfoResultModel loginInfo;
}

class CurrentLoginInfoLoading extends CurrentLoginInfoState {}

class CurrentLoginInfoFail extends CurrentLoginInfoState {
  CurrentLoginInfoFail(this.error);

  final String error;
}
