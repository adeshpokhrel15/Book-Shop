import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends StatelessWidget {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final isLogin = ref.watch(loginProvider);
        return SafeArea(
          child: Form(
            key: _form,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text(
                        isLogin ? 'Login Form' : 'SignUp Form',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  if (isLogin == false)
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide username';
                        } else if (val.length > 20) {
                          return 'you should put the character less than 20';
                        } else {
                          return null;
                        }
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                          hintText: 'FullName',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder()),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'please provide email';
                      } else if (!val.contains('@')) {
                        return 'please provide actual email';
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'please provide password';
                      } else if (val.length < 6) {
                        return 'password must be greater than 5 character';
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, ref, child) {
                    return ElevatedButton(
                        onPressed: () async {
                          _form.currentState!.save();
                          if (_form.currentState!.validate()) {
                            if (isLogin == true) {
                              FocusScope.of(context).unfocus();
                              await ref.read(authProvider).userlogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            } else {
                              await ref.read(authProvider).signUp(
                                  email: emailController.text.trim(),
                                  full_name: userNameController.text.trim(),
                                  password: passwordController.text.trim());
                              FocusScope.of(context).unfocus();
                            }
                          }
                        },
                        child: Text('Submit'));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isLogin
                          ? 'Don\'t have an Account'
                          : 'Already have an account'),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(loginProvider.notifier).toggle();
                        },
                        child: Text(isLogin ? 'SignUp' : 'Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
