import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/pages/home/home_page.dart';
import 'package:test_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: ListView(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInError) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                autofocus: true,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(value, passwordController.text),
                  );
                },
                decoration: InputDecoration(
                  hintText: "Email address...",
                ),
              ),
              SizedBox(height: 7),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, value),
                  );
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Password...",
                ),
              ),
              SizedBox(height: 15),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        if (state is SignInValidState) {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SignInBloc>(context).add(
                                SignInSubmittedEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: null,
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
