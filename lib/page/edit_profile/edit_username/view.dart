import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin/app/assets/name.dart';
import 'package:pinpin/app/theme/app_theme.dart';
import 'package:pinpin/component/header/navigation_bar.dart';
import 'package:pinpin/component/stateful_button/pp_common_text_button.dart';
import 'package:pinpin/component/stateful_button/pp_image_button.dart';
import 'package:pinpin/component/widget_extensions/ext.dart';
import 'package:pinpin/util/clipper.dart';

import 'controller.dart';

class EditUsernamePage extends StatelessWidget {
  EditUsernamePage({Key? key}) : super(key: key);

  final controller = Get.find<EditUsernameController>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          highlightColor: Colors.transparent,// 去除水波纹
          splashColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PPNavigationBar(title: "昵称"),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: controller.controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      var filterPattern = RegExp(
                          r'(?![a-zA-Z.]+$)(?![0-9A-Z.]+$)(?![0-9a-z.]+$)(?![0-9a-zA-Z]+$)[0-9a-zA-Z.]{6,8}');
                      final Iterable<Match> matches =
                          filterPattern.allMatches(value);
                      if (matches.isNotEmpty) {}
                    },
                  ),
                )
                    .background(const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppTheme.gray100,
                        boxShadow: [AppTheme.shadow],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ))
                    .marginSymmetric(horizontal: 16),
              ),

              const Padding(padding: EdgeInsets.only(bottom: 180)),

              PPCommonTextButton(
                title: '确认发布',
                onPressed: () {
                  Get.back();
                },
              ),
              const Spacer()
            ],
          )),
    );
  }
}
