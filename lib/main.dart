import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/bloc.dart';
import 'package:flutter_model/dio_service.dart';
import 'package:flutter_model/home_screen.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..getProducts(),
        child: MaterialApp(
          home: HomeScreen(),
        ));
  }
}
