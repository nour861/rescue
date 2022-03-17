import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue/shared/component/components.dart';
import '../modules/patient/measurements.dart';
import '../shared/cubit/cubit_doctor/cubit.dart';
import '../shared/cubit/cubit_doctor/state.dart';

class AppLayout extends StatelessWidget {

  final bool type;
  AppLayout({required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit=DoctorCubit.get(context);
          var actionBtn=null;
          Widget screen;
          if(type){
            screen= cubit.bodyPatient[cubit.currentIndex];
            print('type:$type');
          }
          else{
            screen= cubit.bodyDoctor[cubit.currentIndex];
            print('type:$type');
          }

          if(cubit.currentIndex==0 && type)
          {
            actionBtn= [
              IconButton(
                  onPressed: (){
                    navigateTo(context, Measurements());
                  },
                  icon: const Icon(Icons.science))
            ];
          }

        return
          Scaffold(
            appBar: AppBar(
              title: cubit.bar[cubit.currentIndex],
              actions:actionBtn ,
            ),
            body:screen,
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
           cubit.changeBottomNavBar(index);
          },
         items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notifications'),
         BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Profile'),
              ],
            ),
          );
        }
    );
  }
}
