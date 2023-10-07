import 'package:flutter/material.dart';

abstract class BaselistCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;

  const BaselistCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      required this.onPressedPlay});
}
