import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? password;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Your Name'),
                ),
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Your email'),
                ),
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Your password'),
                ),
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _key.currentState!.save();
                  BlocProvider.of<AuthBloc>(context).add(
                    SignInUserEvent(email!, password!),
                  );
                },
                child: const Text(
                  "create account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
