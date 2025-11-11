import 'package:appointments_app/features/auth/model/sign_in_model/sign_in_model.dart';
import 'package:appointments_app/features/auth/service/auth_service.dart';
import 'package:appointments_app/features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/auth_state.dart';
part 'states/sign_in_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authService, this.authManagerBloc) : super(AuthInitial());
  final AuthService authService;
  final AuthManagerBloc? authManagerBloc;
}
