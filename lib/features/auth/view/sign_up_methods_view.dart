import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class SignUpMethodsViewCallBacks {}

@RoutePage()
class SignUpMethodsView extends StatelessWidget {
  const SignUpMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpMethodsPage();
  }
}

class SignUpMethodsPage extends StatefulWidget {
  const SignUpMethodsPage({super.key});

  @override
  State<SignUpMethodsPage> createState() => _SignUpMethodsPageState();
}

class _SignUpMethodsPageState extends State<SignUpMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppConstants.padding16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AuthHeader(title: "create_account".tr())],
        ),
      ),
    );
  }
}
