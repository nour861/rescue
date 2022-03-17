import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class DoctorHomeScreen extends StatelessWidget {
  
  var control;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            TextFormField(
              controller: control,
              decoration: InputDecoration(
                hintText:'Search',
                fillColor: Colors.grey[200],
                suffixIcon: Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: patientBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
