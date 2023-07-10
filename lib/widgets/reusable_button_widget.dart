import 'package:flutter/material.dart';

class ReusableButtonWidget extends StatelessWidget {
  ReusableButtonWidget({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  VoidCallback onTap;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        color: Color(0xff0E2232),
        child: Icon(iconData, color: Colors.white,),
      ),
    );
  }
}
