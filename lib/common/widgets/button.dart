import 'package:amazon_tut/dimensions.dart';
import 'package:amazon_tut/smallText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, Dimensions.height50))
        ),
        onPressed: onTap,
        child: SmallText(text: text,)
    );
  }
}
