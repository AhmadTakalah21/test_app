part of 'auth_manager_bloc.dart';

abstract class GeneralAuthManagerState {
  const GeneralAuthManagerState();
}

class InitialAuthManagerState extends GeneralAuthManagerState {}

class FirstTimeState extends GeneralAuthManagerState {}

class ShowSignInState extends GeneralAuthManagerState {
  const ShowSignInState({this.action});

  final VoidCallback? action;
}

class AuthenticatedState extends GeneralAuthManagerState {}

class UnauthenticatedState extends GeneralAuthManagerState {}

class GuestState extends GeneralAuthManagerState {}

class VerificationState extends GeneralAuthManagerState {}

class ForgetPasswordState extends GeneralAuthManagerState {}
