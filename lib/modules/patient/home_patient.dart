import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Expanded(flex:2 ,child: patientBuilder()),
          SizedBox(height: 35,),
          Text('Other Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Expanded(flex: 1,child: patientBuilder()),
        ],
      ),
    );
  }
}
