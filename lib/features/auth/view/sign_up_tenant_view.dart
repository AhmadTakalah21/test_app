import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class SignUpTenantViewCallBacks {
  void onCreateWorkspace();
}

@RoutePage()
class SignUpTenantView extends StatelessWidget {
  const SignUpTenantView({super.key});

  @override
  Widget build(BuildContext context) => const SignUpTenantPage();
}

class SignUpTenantPage extends StatefulWidget {
  const SignUpTenantPage({super.key});

  @override
  State<SignUpTenantPage> createState() => _SignUpTenantPageState();
}

class _SignUpTenantPageState extends State<SignUpTenantPage>
    implements SignUpTenantViewCallBacks {
  final _workspaceCtrl = TextEditingController();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();

  final _wsRegex = RegExp(r'^[a-z0-9](?:[a-z0-9\-]{1,30}[a-z0-9])?$');

  bool get _wsOk => _wsRegex.hasMatch(_workspaceCtrl.text.trim());
  bool get _firstOk => _firstNameCtrl.text.trim().isNotEmpty;
  bool get _lastOk => _lastNameCtrl.text.trim().isNotEmpty;
  bool get _isEnabled => _wsOk && _firstOk && _lastOk;

  @override
  void initState() {
    super.initState();
    _workspaceCtrl.addListener(_invalidate);
    _firstNameCtrl.addListener(_invalidate);
    _lastNameCtrl.addListener(_invalidate);
  }

  @override
  void dispose() {
    _workspaceCtrl.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    super.dispose();
  }

  void _invalidate() => setState(() {});

  @override
  void onCreateWorkspace() {
    context.router.push(const SignUpSuccessRoute());
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.blackShade2,
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _underlineBlock({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        const SizedBox(height: 6),
        child,
        const SizedBox(height: 1),
        Container(height: 1, color: const Color(0xFFE6E6E6)),
      ],
    );
  }

  Widget _workspaceRow() {
    return Row(
      children: [
        const Icon(
          Icons.groups_2_rounded,
          size: 16,
          color: AppColors.blackShade,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MainTextField(
            controller: _workspaceCtrl,
            title: null,
            hintText: "workspace_name_star".tr(),
            textInputAction: TextInputAction.next,
            prefixIcon: const SizedBox(),
            showCloseIcon: false,

            style: MainTextFieldStyle.none,

            contentPadding: const EdgeInsets.only(top: 12),

            onChanged: (v) {
              final lower = v.toLowerCase();
              if (v != lower) {
                final sel = _workspaceCtrl.selection;
                _workspaceCtrl
                  ..text = lower
                  ..selection = sel;
              }
            },
            hintStyle: TextStyle(
              color: AppColors.greyShade,
              fontSize: 14,
              height: 1.2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        const SizedBox(width: 8),
        Text(
          ".workiom.com",
          style: TextStyle(
            color: AppColors.greyShade,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _nameRow({
    required TextEditingController controller,
    required String hintKey,
    required TextInputAction action,
  }) {
    return Row(
      children: [
        const Icon(Icons.notes_rounded, size: 16, color: AppColors.blackShade),
        const SizedBox(width: 10),
        Expanded(
          child: MainTextField(
            controller: controller,
            title: null,
            hintText: hintKey.tr(),
            textInputAction: action,
            prefixIcon: const SizedBox(),
            showCloseIcon: true,

            style: MainTextFieldStyle.none,

            contentPadding: const EdgeInsets.only(top: 12),

            hintStyle: TextStyle(
              color: AppColors.greyShade,
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.mainColor,
          ),
          onPressed: () => context.router.maybePop(),
          tooltip: 'Back',
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeader(title: "enter_company_name".tr()),
              const Spacer(),

              _underlineBlock(
                title: "your_company_or_team".tr(),
                child: _workspaceRow(),
              ),
              const SizedBox(height: 16),

              _underlineBlock(
                title: "your_first_name".tr(),
                child: _nameRow(
                  controller: _firstNameCtrl,
                  hintKey: "enter_first_name",
                  action: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 16),

              _underlineBlock(
                title: "your_last_name".tr(),
                child: _nameRow(
                  controller: _lastNameCtrl,
                  hintKey: "enter_last_name",
                  action: TextInputAction.done,
                ),
              ),

              const SizedBox(height: 24),

              MainActionButton(
                onPressed: () {
                  if (_isEnabled) onCreateWorkspace();
                },
                buttonColor: _isEnabled
                    ? AppColors.mainColor
                    : AppColors.mainColorSecondary,
                text: "create_workspace".tr(),
              ),

              const Spacer(),
              const AuthTail(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
