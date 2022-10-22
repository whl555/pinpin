/// pinpin - navigation_bar
/// Created by xhz on 06/09/2022

import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pinpin/app/assets/name.dart';
import 'package:pinpin/app/theme/app_theme.dart';
import 'package:pinpin/component/stateful_button/pp_image_button.dart';

const PPNavigationBarHeight = 41.0;
final physicalPadding = window.padding;
final devicePixelRatio = window.devicePixelRatio;

final windowPadding = EdgeInsets.only(
  top: physicalPadding.top / devicePixelRatio,
  left: physicalPadding.left / devicePixelRatio,
  bottom: physicalPadding.bottom / devicePixelRatio,
  right: physicalPadding.right / devicePixelRatio,
);

class PPNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const PPNavigationBar({super.key, this.title, this.trailing = const SizedBox(), this.backAction = defaultBackAction});

  final String? title;
  final Widget trailing;
  final void Function() backAction;

  static void defaultBackAction() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final Widget back;
    final padding = windowPadding;
    if (Get.previousRoute != "") {
      back = PPImageButton(
        active: AppAssets.arrow_left,
        onPressed: backAction,
        padding: 7.2,
      );
    } else {
      back = const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.only(top: padding.top, right: padding.right, left: padding.left),
      child: SizedBox(
        height: PPNavigationBarHeight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: back,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(7.2),
                child: IconTheme(
                  data: const IconThemeData(
                    color: AppTheme.primary,
                    size: 24,
                  ),
                  child: trailing,
                ),
              ),
            ),
            Center(
              child: Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: AppTheme.headline2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(PPNavigationBarHeight);
}
