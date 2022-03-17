import 'package:flutter/material.dart';

import '../../../modules/patient/rescuer_person.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({Key? key}) : super(key: key);

  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color:
              isSelected1 ? const Color(0xff22c0e1) : const Color(0xfff5f5f5),
          child: MaterialButton(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 30.0),
              child: Text(
                'Patient',
                style: TextStyle(
                    fontSize: 16,
                    color:
                        isSelected1 ? Colors.white : const Color(0xff878787)),
              ),
            ),
            onPressed: () {
              setState(() {
                isSelected1 = !isSelected1;
                isSelected2 = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RescuerPerson()));
            },
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Container(
          color:
              isSelected2 ? const Color(0xff22c0e1) : const Color(0xfff5f5f5),
          child: MaterialButton(
            onPressed: () {
              setState(() {
                isSelected2 = !isSelected2;
                isSelected1 = false;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 30.0),
              child: Text(
                'Doctor',
                style: TextStyle(
                    fontSize: 16,
                    color:
                        isSelected2 ? Colors.white : const Color(0xff878787)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
