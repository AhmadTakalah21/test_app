import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/features/auth/model/tenant_availability_model/tenant_availability_model.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_app_bar.dart';
import 'package:appointments_app/global/widgets/main_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignUpTenantViewCallBacks {
  Future<void> onCreateWorkspace();
}

@RoutePage()
class SignUpTenantView extends StatelessWidget {
  const SignUpTenantView({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authCubit,
      child: const SignUpTenantPage(),
    );
  }
}

class SignUpTenantPage extends StatefulWidget {
  const SignUpTenantPage({super.key});

  @override
  State<SignUpTenantPage> createState() => _SignUpTenantPageState();
}

class _SignUpTenantPageState extends State<SignUpTenantPage>
    implements SignUpTenantViewCallBacks {
  late AuthCubit authCubit;

  final _workspaceCtrl = TextEditingController();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl  = TextEditingController();

  final _wsRegex = RegExp(r'^[a-z0-9](?:[a-z0-9\-]{1,30}[a-z0-9])?$');

  bool get _wsOk    => _wsRegex.hasMatch(_workspaceCtrl.text.trim());
  bool get _firstOk => _firstNameCtrl.text.trim().isNotEmpty;
  bool get _lastOk  => _lastNameCtrl.text.trim().isNotEmpty;
  bool get _formOk  => _wsOk && _firstOk && _lastOk;

  bool _submitting = false;

  @override
  void initState() {
    super.initState();

    authCubit = context.read<AuthCubit>();

    _workspaceCtrl.addListener(_onWsChanged);

    _firstNameCtrl.addListener(() {
      setState(() {});
      authCubit.setAdminFirstName(_firstNameCtrl.text.trim());
    });

    _lastNameCtrl.addListener(() {
      setState(() {});
      authCubit.setAdminLastName(_lastNameCtrl.text.trim());
    });
  }

  @override
  void dispose() {
    _workspaceCtrl.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    super.dispose();
  }

  void _onWsChanged() {
    // enforce lower-case
    final v = _workspaceCtrl.text;
    final lower = v.toLowerCase();
    if (v != lower) {
      final sel = _workspaceCtrl.selection;
      _workspaceCtrl
        ..text = lower
        ..selection = sel;
    }
    setState(() {});
    authCubit.setTenancyName(lower.trim());

    // اسم العرض (Company name) من الـtenancy
    if (lower.trim().isNotEmpty) {
      final pretty = lower.replaceAll('-', ' ');
      final titled = pretty.isEmpty
          ? lower
          : pretty[0].toUpperCase() + pretty.substring(1);
      authCubit.setName(titled);
    }
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
        const Icon(Icons.groups_2_rounded, size: 16, color: AppColors.blackShade),
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
  Future<void> onCreateWorkspace() async {
    if (!_formOk || _submitting) return;

    setState(() => _submitting = true);
    try {
      // 1) مزامنة القيم مع الـ Cubit بسرعة
      final ws    = _workspaceCtrl.text.trim().toLowerCase();
      final first = _firstNameCtrl.text.trim();
      final last  = _lastNameCtrl.text.trim();

      final pretty = ws.replaceAll('-', ' ').trim();
      final titled = pretty.isEmpty ? ws : '${pretty[0].toUpperCase()}${pretty.substring(1)}';

      authCubit
        ..setTenancyName(ws)
        ..setName(titled)
        ..setAdminFirstName(first)
        ..setAdminLastName(last);

      // 2) فحص توافر الاسم: state==1 محجوز، state==3 متاح
      await authCubit.checkTenantAvailability(ws);
      if (!mounted) return;

      if (authCubit.state is! TenantAvailabilitySuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('something_went_wrong'.tr())),
        );
        return;
      }

      final availability =
          (authCubit.state as TenantAvailabilitySuccess).tenantAvailability;

      if (availability.state == 1) {
        // الاسم محجوز
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('tenant_unavailable'.tr())),
        );
        return;
      }
      if (availability.state != 3) {
        // حالة غير متوقعة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('something_went_wrong'.tr())),
        );
        return;
      }

      // 3) تأمين editionId إن لم يُحدّد
      bool needEditionId = false;
      try {
        authCubit.registerModel.editionId; // سيرمي إن كانت null وفق موديلك
      } catch (_) {
        needEditionId = true;
      }

      if (needEditionId) {
        await authCubit.getEditionsForSelect();
        if (!mounted) return;

        if (authCubit.state is! EditionsForSelectSuccess) {
          final err = authCubit.state is EditionsForSelectFail
              ? (authCubit.state as EditionsForSelectFail).error
              : 'something_went_wrong'.tr();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
          return;
        }

        final model =
            (authCubit.state as EditionsForSelectSuccess).model;
        final items = model.editionsWithFeatures;

        int? pickedId;

        // أولوية: Edition يحتوي "free"
        final iFree = items.indexWhere(
              (e) => e.edition.displayName.toLowerCase().contains('free'),
        );
        if (iFree != -1) pickedId = items[iFree].edition.id;

        // ثم أول isRegistrable==true
        if (pickedId == null) {
          final iReg = items.indexWhere((e) => e.edition.isRegistrable == true);
          if (iReg != -1) pickedId = items[iReg].edition.id;
        }

        // وإلا أول عنصر متاح
        pickedId ??= items.isNotEmpty ? items.first.edition.id : null;

        if (pickedId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('something_went_wrong'.tr())),
          );
          return;
        }

        authCubit.setEditionId(pickedId);
      }

      // 4) التسجيل
      await authCubit.register();
      if (!mounted) return;

      if (authCubit.state is RegisterSuccess) {
        context.router.replace(const SignUpSuccessRoute());
        return;
      }

      final err = authCubit.state is RegisterFail
          ? (authCubit.state as RegisterFail).error
          : 'something_went_wrong'.tr();

      // إن كانت رسالة الحجز ظهرت من السيرفر، حوّلها لنص واضح
      final lower = err.toLowerCase();
      final friendly = (lower.contains('reserved') || lower.contains('taken'))
          ? 'tenant_unavailable'.tr()
          : err;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(friendly)));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }



  @override
  Widget build(BuildContext context) {
    final canSubmit = _formOk && !_submitting;

    return Scaffold(
      appBar: const MainAppBar(),
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
                onPressed: onCreateWorkspace,
                text: "create_workspace".tr(),
                enabled: canSubmit,
                isLoading: _submitting,
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
