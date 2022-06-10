import 'package:amazon_tut/constants/constants.dart';
import 'package:amazon_tut/dimensions.dart';
import 'package:amazon_tut/features/auth/widgets/BigText.dart';
import 'package:amazon_tut/smallText.dart';
import 'package:flutter/material.dart';

//Enumeration
enum AuthEnum{
  signIn,
  signUp
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEnum? _authEnum = AuthEnum.signUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Welcome"),
              ListTile(
                title: SmallText(
                  text: "Create Account",
                ),
                leading: Radio(
                  value: AuthEnum.signUp,
                  activeColor: GlobalVariables.secondaryColor,
                  groupValue: _authEnum, // when initiallize, this value will show up
                  onChanged: (AuthEnum? val){
                    setState(() {
                      _authEnum = val;
                    });
                  },
                )
              ),
              ListTile(
                title: SmallText(text: 'Login'),
                leading: Radio(
                  value: AuthEnum.signIn,
                  groupValue: _authEnum,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (AuthEnum? val){
                    setState(() {
                      _authEnum = val;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
