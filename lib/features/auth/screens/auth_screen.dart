import 'package:amazon_tut/common/widgets/button.dart';
import 'package:amazon_tut/common/widgets/text_field.dart';
import 'package:amazon_tut/constants/constants.dart';
import 'package:amazon_tut/dimensions.dart';
import 'package:amazon_tut/common/widgets/BigText.dart';
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
  final _formSignup = GlobalKey<FormState>();
  final _formSignIn = GlobalKey<FormState>();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    nameCtr.dispose();
    emailCtr.dispose();
    passCtr.dispose();
  }

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
              if(_authEnum == AuthEnum.signUp)
                Container(
                  padding: EdgeInsets.all(Dimensions.height18),
                  // margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)
                  ),
                  child: Form(
                      key: _formSignup,
                      child:  Column(
                        children: [
                           CustomTextField(text: 'Name', controller: nameCtr,),
                          SizedBox(height: Dimensions.height12,),
                          CustomTextField(text: 'Email', controller: emailCtr,),
                          SizedBox(height: Dimensions.height12,),
                          CustomTextField(text: 'Password', controller: passCtr,),
                          SizedBox(height: Dimensions.height12,),
                          CustomButton(text: 'Sign-Up', onTap: (){
                            if(_formSignup.currentState!.validate()){
                              return null;
                            }

                          },)
                        ],
                      )
                  ),
                ),
              ListTile(
                title: SmallText(text: 'Sign-In'),
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
