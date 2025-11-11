import 'package:appointments_app/features/auth/model/editions_for_select_model/editions_for_select_model.dart';
import 'package:appointments_app/features/auth/model/login_info_result_model/login_info_result_model.dart';
import 'package:appointments_app/features/auth/model/password_strength_model/password_strength_model.dart';
import 'package:appointments_app/features/auth/model/register_model/register_model.dart';
import 'package:appointments_app/features/auth/model/register_result_model/register_result_model.dart';
import 'package:appointments_app/features/auth/model/sign_in_model/sign_in_model.dart';
import 'package:appointments_app/features/auth/model/tenant_availability_model/tenant_availability_model.dart';
import 'package:appointments_app/features/auth/service/auth_service.dart';
import 'package:appointments_app/features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/auth_state.dart';
part 'states/sign_in_state.dart';
part 'states/current_login_info_state.dart';
part 'states/editions_for_select_state.dart';
part 'states/password_complexity_state.dart';
part 'states/tenant_availability_state.dart';
part 'states/register_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authService, this.authManagerBloc) : super(AuthInitial());
  final AuthService authService;
  final AuthManagerBloc? authManagerBloc;

  RegisterModel registerModel = const RegisterModel();
  String? timeZone;

  void setAdminEmail(String email) {
    registerModel = registerModel.copyWith(adminEmailAddress: () => email);
  }

  void setAdminFirstName(String firstName) {
    registerModel = registerModel.copyWith(adminFirstName: () => firstName);
  }

  void setAdminLastName(String lastName) {
    registerModel = registerModel.copyWith(adminLastName: () => lastName);
  }

  void setAdminPassword(String password) {
    registerModel = registerModel.copyWith(adminPassword: () => password);
  }

  void setCaptchaResponse(String? captcha) {
    registerModel = registerModel.copyWith(captchaResponse: () => captcha);
  }

  void setEditionId(int editionId) {
    registerModel = registerModel.copyWith(editionId: () => editionId);
  }

  void setName(String name) {
    registerModel = registerModel.copyWith(name: () => name);
  }

  void setTenancyName(String tenancyName) {
    registerModel = registerModel.copyWith(tenancyName: () => tenancyName);
  }

  void setTimeZone(String? timeZone) => this.timeZone = timeZone;

  void resetRegisterModel() => registerModel = const RegisterModel();

  Future<void> getCurrentLoginInfo() async {
    emit(CurrentLoginInfoLoading());
    try {
      if (isClosed) return;
      final loginInfo = await authService.getCurrentLoginInfo();
      emit(CurrentLoginInfoSuccess(loginInfo.result));
    } catch (e) {
      if (isClosed) return;
      emit(CurrentLoginInfoFail(e.toString()));
    }
  }

  Future<void> getEditionsForSelect() async {
    emit(EditionsForSelectLoading());
    try {
      if (isClosed) return;
      final loginInfo = await authService.getEditionsForSelect();
      emit(EditionsForSelectSuccess(loginInfo.result));
    } catch (e) {
      if (isClosed) return;
      emit(EditionsForSelectFail(e.toString()));
    }
  }

  Future<void> getPasswordComplexity() async {
    emit(PasswordComplexityLoading());
    try {
      if (isClosed) return;
      final passStrength = await authService.getPasswordComplexity();
      emit(PasswordComplexitySuccess(passStrength.result));
    } catch (e) {
      if (isClosed) return;
      emit(PasswordComplexityFail(e.toString()));
    }
  }

  Future<void> checkTenantAvailability(String name) async {
    emit(TenantAvailabilityLoading());
    try {
      if (isClosed) return;
      final availability = await authService.checkTenantAvailability(name);
      emit(TenantAvailabilitySuccess(availability.result));
    } catch (e) {
      if (isClosed) return;
      emit(TenantAvailabilityFail(e.toString()));
    }
  }

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      if (isClosed) return;
      final model = await authService.register(
        registerModel,
        timeZone: timeZone,
      );
      emit(RegisterSuccess(model.result));
    } catch (e) {
      if (isClosed) return;
      emit(RegisterFail(e.toString()));
    }
  }
}
