import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rescue/modules/sign_up_screen.dart';

import '../../layout/app_layout.dart';
import '../../shared/component/components/custom_button.dart';

class RescuerPerson extends StatefulWidget {
  const RescuerPerson({Key? key}) : super(key: key);

  @override
  _RescuerPersonState createState() => _RescuerPersonState();
}

class _RescuerPersonState extends State<RescuerPerson> {
  final TextEditingController phoneController = TextEditingController();
  bool? isPatient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/rescuer.png',
                  ),
                  fit: BoxFit.cover,
                  width: 280,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'RESCUER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff4e5e78)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Text(
                    'Enter your rescuer number to call in case of emergency.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.13)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        textFieldController: phoneController,
                        formatInput: false,
                        maxLength: 11,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        cursorColor: Colors.black,
                        inputDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16),
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        bottom: 8,
                        child: Container(
                          height: 40,
                          width: 1,
                          color: Colors.black.withOpacity(0.13),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: 'Sign Up',
                  onPress: () {
                    isPatient = true;
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
        ));
  }
}
