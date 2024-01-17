import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

// ignore: must_be_immutable
class CustomSwitchListTile extends StatelessWidget {
  bool value;
  final Function(bool value)? onChanged;
  final String title;
  final String subTitle;
  CustomSwitchListTile(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      selectedTileColor: Theme.of(context).hintColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: fSize * 1.1,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: fSize * .95,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
