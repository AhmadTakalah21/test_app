import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/global/di/di.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'AuthRouter')
class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AuthCubit>(),
      child: const AutoRouter(),
    );
  }
}

