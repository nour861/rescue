import 'package:flutter/material.dart';
import 'package:rescue/layout/app_layout.dart';

import '../shared/component/components/custom_button.dart';
import 'sign_up_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool? isPatient;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff22c0e1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  //  height: MediaQuery.of(context).size.height / 4,
                  ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                //  height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Welcome Back!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xff0064b0)),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
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
                            controller: passwordController,
                            obscureText: hidePassword,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff22c0e1),
                              ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Forget your Password?',
                                  style: TextStyle(color: Color(0xff0064b0))),
                            ),
                          ),
                          CustomButton(
                            title: 'Sign In',
                            onPress: () {
                              setState(() {
                                if (emailController.text == 'doctor') {
                                  isPatient = false;
                                } else if (emailController.text == 'patient') {
                                  isPatient = true;
                                }
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AppLayout(
                                                type: isPatient!,
                                              )),
                                      (route) => false);
                                }
                              });
                            },
                            textColor: Colors.white,
                            bkColor: const Color(0xff22c0e1),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const SignUp()));
                                },
                                child: const Text(
                                  'Don\'t Have Account? Sign Up Here',
                                  style: TextStyle(color: Color(0xff0064b0)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
