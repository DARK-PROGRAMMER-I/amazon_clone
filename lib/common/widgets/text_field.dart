import 'package:amazon_tut/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextField({Key? key,

    required this.text, required this.controller

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalVariables.unselectedNavBarColor
            )
          ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: GlobalVariables.unselectedNavBarColor
            )
        ),
      ),
      validator: (val) => val!.isEmpty ? 'Please enter any shit' : null ,
    );
  }
}
