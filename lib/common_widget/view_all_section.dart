import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../common/color_extension.dart';

class ViewAllSection extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Callback onPressed;
  const ViewAllSection(
      {super.key,
      required this.title,
      this.buttonTitle = "View All",
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color: TColor.primaryText80,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: TextStyle(color: TColor.org, fontSize: 11),
              ))
        ],
      ),
    );
  }
}
