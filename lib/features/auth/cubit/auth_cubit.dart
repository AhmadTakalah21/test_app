import 'package:appointments_app/features/auth/model/editions_for_select_model/editions_for_select_model.dart';
import 'package:appointments_app/features/auth/model/editions_with_features_model/editions_with_features_model.dart';
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

  SignInModel signInModel = const SignInModel();

  void setSignInTenant(String tenant) {
    signInModel = signInModel.copyWith(tenantName: () => tenant);
  }

  void setSignInEmailOrUser(String emailOrUser) {
    signInModel = signInModel.copyWith(
      userNameOrEmailAddress: () => emailOrUser,
    );
  }

  void setSignInPassword(String password) {
    signInModel = signInModel.copyWith(password: () => password);
  }

  void setRememberClient(bool remember) {
    signInModel = signInModel.copyWith(rememberClient: () => remember);
  }

  void _normalizeTenantFields() {
    try {
      final tn = registerModel.tenancyName.trim().toLowerCase();
      if (tn != registerModel.tenancyName) {
        setTenancyName(tn);
      }
    } catch (_) {}

    try {
      final _ = registerModel.name;
    } catch (_) {
      try {
        final tn = registerModel.tenancyName;
        if (tn.isNotEmpty) {
          final pretty = tn.replaceAll('-', ' ').trim();
          final titled = pretty.isEmpty
              ? tn
              : pretty[0].toUpperCase() + pretty.substring(1);
          setName(titled);
        }
      } catch (_) {}
    }
  }

  bool _hasEditionAssigned() {
    try {
      final _ = registerModel.editionId;
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _ensureEditionId() async {
    if (_hasEditionAssigned()) return;

    final res = await authService.getEditionsForSelect();
    final EditionsForSelectModel data = res.result;

    if (data.tenantEditionId != null) {
      setEditionId(data.tenantEditionId!);
      return;
    }

    final List<EditionWithFeaturesModel> list = data.editionsWithFeatures;
    if (list.isEmpty) return;

    bool isFree(dynamic edition) {
      try {
        final dynamic price =
            (edition.price ?? edition.monthlyPrice ?? edition.annualPrice);
        final dynamic freeFlag = edition.isFree ?? edition.free ?? false;
        if (freeFlag == true) return true;
        if (price is num && price == 0) return true;
        return false;
      } catch (_) {
        return false;
      }
    }

    int? readId(dynamic edition) {
      try {
        if (edition.id is int) return edition.id as int;
        if (edition.value is int) return edition.value as int;
      } catch (_) {}
      return null;
    }

    EditionWithFeaturesModel? chosen = list.firstWhere(
      (e) => isFree(e.edition),
      orElse: () => list.first,
    );

    final id = readId(chosen.edition);
    if (id != null) setEditionId(id);
  }

  Future<void> getCurrentLoginInfo() async {
    emit(CurrentLoginInfoLoading());
    try {
      if (isClosed) return;
      final loginInfo = await authService.getCurrentLoginInfo();
      if (isClosed) return;
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
      final editions = await authService.getEditionsForSelect();
      if (isClosed) return;
      emit(EditionsForSelectSuccess(editions.result));
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
      if (isClosed) return;
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
      final normalized = name.trim().toLowerCase();
      setTenancyName(normalized);
      final availability = await authService.checkTenantAvailability(
        normalized,
      );
      if (isClosed) return;
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

      _normalizeTenantFields();

      await _ensureEditionId();

      final resp = await authService.register(
        registerModel,
        timeZone: timeZone,
      );

      if (isClosed) return;
      emit(RegisterSuccess(resp.result));
    } catch (e) {
      if (isClosed) return;
      emit(RegisterFail(e.toString()));
    }
  }

  Future<void> signIn() async {
    emit(SignInLoading());
    try {
      if (isClosed) return;

      final auth = await authService.authenticate(
        tenantName: signInModel.tenantName,
        emailOrUserName: signInModel.userNameOrEmailAddress,
        password: signInModel.password,
        ianaTimeZone: timeZone ?? 'UTC',
        rememberClient: signInModel.rememberClient ?? false,
      );

      // authManagerBloc?.add(SignedIn(accessToken: auth.result.accessToken));

      if (isClosed) return;
      emit(SignInSuccess(auth.result));
    } catch (e) {
      if (isClosed) return;
      emit(SignInFail(e.toString()));
    }
  }

  Future<void> registerAndSignIn() async {
    await register();
    if (state is! RegisterSuccess) return;

    setSignInTenant(registerModel.tenancyName);
    setSignInEmailOrUser(registerModel.adminEmailAddress);
    setSignInPassword(registerModel.adminPassword);
    setRememberClient(true);

    await signIn();
  }
}
