import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  void _defaultBack() => context.router.maybePop();

  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: false,
      bottom: widget.bottom,

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),

      leadingWidth: 140,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: widget.onBack ?? _defaultBack,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.mainColor),
            ),
          ),
          if (title != null) ...[
            const SizedBox(width: 2),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),

      title: null,
      actions: widget.actions,
    );
  }
}
