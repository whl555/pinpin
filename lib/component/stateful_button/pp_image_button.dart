/// pinpin - pp_image_button
/// Created by xhz on 05/08/2022
import 'package:flutter/material.dart';
import 'package:widget/button/hold.dart';

class PPImageButton extends StatelessWidget {
  PPImageButton({super.key, required this.onPressed, required String active, double? size = 30, double padding = 10}) {
    _active = Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        active,
        height: size,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  PPImageButton.fromImage(Widget data, {super.key, required this.onPressed, double padding = 10}) {
    _active = Padding(
      padding: EdgeInsets.all(padding),
      child: data,
    );
  }

  final void Function() onPressed;
  late final Widget _active;

  @override
  Widget build(BuildContext context) {
    return HoldButton(
      onPressed: onPressed,
      child: _active,
    );
  }
}
