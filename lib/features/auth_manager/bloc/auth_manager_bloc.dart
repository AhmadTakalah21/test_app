import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appointments_app/features/auth/model/sign_in_model/sign_in_model.dart';
import 'package:appointments_app/global/di/di.dart';

part 'auth_manager_event.dart';
part 'auth_manager_state.dart';

@singleton
class AuthManagerBloc extends Bloc<AuthManagerEvent, GeneralAuthManagerState> {
  AuthManagerBloc() : super(InitialAuthManagerState()) {
    on<IsAuthenticatedOrFirstTime>(_findIfAuthenticatedOrFirstTime);
    on<SignInRequested>(_signIn);
    on<SignOutRequested>(_signOut);
  }

  final prefs = get<SharedPreferences>();

  Future<void> _findIfAuthenticatedOrFirstTime(
    IsAuthenticatedOrFirstTime event,
    Emitter<GeneralAuthManagerState> emit,
  ) async {
    final user = prefs.getString("user");
    if (user != null) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  Future<void> _signIn(
    SignInRequested event,
    Emitter<GeneralAuthManagerState> emit,
  ) async {
    await prefs.setString("user", event.signInModel.toString());
    await prefs.setBool("is_login", true);
    event.onSuccess?.call();
    emit(AuthenticatedState());
  }

  Future<void> _signOut(
    SignOutRequested event,
    Emitter<GeneralAuthManagerState> emit,
  ) async {
    await prefs.remove("user");
    await prefs.remove("token");
    await prefs.setBool("is_login", false);
    emit(UnauthenticatedState());
  }
}
