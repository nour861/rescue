import 'package:flutter/material.dart';
import 'package:rescue/shared/component/components/custom_toggle_button.dart';
import 'package:rescue/shared/component/components/gender_button.dart';

import '../layout/app_layout.dart';
import '../shared/component/components/bithdate.dart';
import '../shared/component/components/custom_button.dart';
import '../shared/component/components/terms_of_use.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isPatient;
  bool hidePassword = true;
  bool confirmPassword = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff0064b0)),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'User Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff22c0e1),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xff22c0e1),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: myPasswordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'You Should Enter Your Password';
                      }
                      return null;
                    },
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff22c0e1)),
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff22c0e1),
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff22c0e1),
                              ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: confirmPassword,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'You should confirm your password';
                      }
                      if (value != myPasswordController.text) {
                        return 'not matches';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Confirm Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff22c0e1)),
                      suffixIcon: IconButton(
                        icon: confirmPassword
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff22c0e1),
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff22c0e1),
                              ),
                        onPressed: () {
                          setState(() {
                            confirmPassword = !confirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const GenderDropDownButton(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const BirthDate(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const CustomToggleButtons(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TermsOfUse(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: 'Sign Up',
                    onPress: () {
                      isPatient = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppLayout(
                                    type: isPatient!,
                                  )));
                    },
                    textColor: Colors.white,
                    bkColor: const Color(0xff22c0e1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
