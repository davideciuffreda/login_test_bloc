import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubits/internet_cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetGained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Connection found!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is InternetLost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Connection lost!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetGained) {
                return Text("Connected!");
              } else if (state is InternetLost) {
                return Text("Not connected!");
              } else {
                return Text("Loading...");
              }
            },
          ),
          /* child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return Text("Connected!");
              } else if (state is InternetLostState) {
                return Text("Not connected!");
              } else {
                return Text("Loading...");
              }
            },
          ), */
        ),
      ),
    );
  }
}
