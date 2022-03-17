import 'package:flutter/material.dart';

class BirthDate extends StatefulWidget {
  const BirthDate({Key? key}) : super(key: key);

  @override
  State<BirthDate> createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  String? birthDateInString;
  DateTime? birthDate;
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const ShapeDecoration(
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      child: ListTile(
        leading: const Text('BirthDate'),
        title: Text(
          birthDate == null
              ? 'Y-M-D'
              : '${birthDate!.year}-${birthDate!.month}-${birthDate!.day}',
          style: TextStyle(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
            icon: const Icon(Icons.calendar_today, color: Color(0xff22c0e1)),
            onPressed: () async {
              final datePick = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if (datePick != null && datePick != birthDate) {
                setState(() {
                  birthDate = datePick;
                  isDateSelected = true;

                  // put it here
                  birthDateInString =
                      "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019
                });
              }
            }),
      ),
    );
  }
}
