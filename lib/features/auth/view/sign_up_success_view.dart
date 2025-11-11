import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpSuccessView extends StatelessWidget {
  const SignUpSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpSuccessPage();
  }
}

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({super.key});

  @override
  State<SignUpSuccessPage> createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Text("Thank you for choosing Workiom".tr()),
            Spacer(),
            AuthTail(),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
