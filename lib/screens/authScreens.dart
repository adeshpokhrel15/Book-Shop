import 'package:bookshop/providers/authProvider.dart';
import 'package:bookshop/providers/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class authScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final isLogin = ref.watch(loginProvider);
          return Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      isLogin ? 'Login Form' : 'Sign Up FORM',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  if (!isLogin)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          hintText: 'Enter your User Name',
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: mailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        _form.currentState!.save();

                        if (isLogin) {
                          ref.read(logSignProvider).Login(
                              email: mailController.text.trim(),
                              password: passController.text.trim());
                        } else {
                          ref.read(logSignProvider).signUp(
                              email: mailController.text.trim(),
                              password: passController.text.trim(),
                              userName: usernameController.text.trim());
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  Row(
                    children: [
                      Text(isLogin
                          ? 'Dont have a account'
                          : 'Already have an account'),
                      TextButton(
                          onPressed: () {
                            ref.read(loginProvider.notifier).toggle();
                          },
                          child: Text(isLogin ? 'Sign Up' : 'Login'))
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
