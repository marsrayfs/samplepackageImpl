import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standalone_pkg/presentation/register_bloc/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.state == RegisterStateEnum.registered) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Signed up successfully!'),
              backgroundColor: Colors.green));
        }
        if (state.state == RegisterStateEnum.failed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.state.name), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        return Card(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email Address'),
                controller: emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<RegisterBloc>().add(StartRegisterEvent(
                      emailController.text, passwordController.text));
                },
                child: const Text("Register"),
              )
            ],
          ),
        );
      },
    );
  }
}
