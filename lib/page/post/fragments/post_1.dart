/// pinpin - view
/// Created by xhz on 2022/8/8
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin/app/theme/app_theme.dart';
import 'package:pinpin/component/stateful_button/pp_image_button.dart';
import 'package:pinpin/component/switcher/switcher.dart';
import 'package:pinpin/component/text_field/pp_text_field.dart';
import 'package:pinpin/page/post/logic.dart';

class PPPost1Fragment extends StatelessWidget {
  const PPPost1Fragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PPPostLogic>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('模块选择', style: AppTheme.headline6),
          PPSwitcher(
            width: 159,
            height: 30,
            rxIndex: 0.obs,
            titles: const ['娱乐拼', '学习拼'],
            fontScale: 0.6,
          ),
          const Text('标签选择', style: AppTheme.headline6),
          SizedBox(height: 96, child: Row(children: [])),
          const Text('拼拼标题', style: AppTheme.headline6),
          PPTextField(
            textFieldStyle: PPTextFieldStyle.backgroundFilled,
            hintText: '请输入标题名称',
          ),
          const Text('活动概述', style: AppTheme.headline6),
          PPTextField(
            textFieldStyle: PPTextFieldStyle.backgroundFilled,
            maxLines: 5,
            hintText: '选填，不超过100字，介绍一下你求拼的事件~',
          ),
        ],
      ),
    );
  }
}
