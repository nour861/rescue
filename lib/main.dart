import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue/shared/cubit/cubit_doctor/cubit.dart';
import 'package:rescue/shared/cubit/cubit_doctor/state.dart';

import 'layout/app_layout.dart';
import 'modules/splash_screen.dart';
import 'modules/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorCubit()),
      ],
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Rescuer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
