import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.actions,
    this.title,
    this.centerTitle = true,
    this.bottom,
    this.automaticallyImplyLeading = true,
    this.bgColor = AppColors.white,
    this.onBack,
  });

  final List<Widget>? actions;
  final String? title;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final bool automaticallyImplyLeading;
  final Color bgColor;
  final void Function()? onBack;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MainAppBarState extends State<MainAppBar> {
  void onBackTap() => context.router.maybePop();

  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 48,
      leadingWidth: 140,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          InkWell(
            onTap: widget.onBack ?? onBackTap,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.mainColor,
            ),
          ),
          if (title != null) ...[
            SizedBox(width: 2),
            Text(
              title,
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.0,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
