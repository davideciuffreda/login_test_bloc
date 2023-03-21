import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubits/internet_cubit/internet_cubit.dart';
import 'package:test_bloc/pages/home/home_page.dart';
import 'package:test_bloc/pages/welcome/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        home: WelcomePage(),
      ),
    );
  }
}
