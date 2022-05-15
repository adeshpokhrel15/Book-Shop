// import 'package:bookshop/providers/authProvider.dart';
// import 'package:bookshop/providers/loginProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class authScreen extends StatelessWidget {
//   final usernameController = TextEditingController();
//   final mailController = TextEditingController();
//   final passController = TextEditingController();

//   final _form = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height,
//                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(children: <Widget>[
//                         Text("Welcome",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                             )),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Automatic identity verification which enables you to verify your identity",
//                           textAlign: TextAlign.center,
//                           style:
//                               TextStyle(color: Colors.grey[700], fontSize: 15),
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height / 3,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('assets/book1.jpg'))),
//                         ),
//                         Consumer(builder: (context, ref, child) {
//                           final isLogin = ref.watch(loginProvider);
//                           return Form(
//                             key: _form,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 30),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       isLogin ? 'Login Form' : 'Sign Up FORM',
//                                       style: TextStyle(fontSize: 25),
//                                     ),
//                                   ),
//                                   if (!isLogin)
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 10),
//                                       child: TextFormField(
//                                         controller: usernameController,
//                                         decoration: InputDecoration(
//                                           labelText: 'UserName',
//                                           hintText: 'Enter your User Name',
//                                         ),
//                                       ),
//                                     ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   TextFormField(
//                                     controller: mailController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Email',
//                                       hintText: 'Enter your email',
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   TextFormField(
//                                     controller: passController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Password',
//                                       hintText: 'Enter your password',
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   Container(
//                                     child: ElevatedButton(
//                                       onPressed: () async {
//                                         _form.currentState!.save();

//                                         if (isLogin) {
//                                           ref.read(logSignProvider).Login(
//                                               email: mailController.text.trim(),
//                                               password:
//                                                   passController.text.trim());
//                                         } else {
//                                           ref.read(logSignProvider).signUp(
//                                               email: mailController.text.trim(),
//                                               password:
//                                                   passController.text.trim(),
//                                               userName: usernameController.text
//                                                   .trim());
//                                         }
//                                       },
//                                       child: Text('Submit'),
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(isLogin
//                                           ? 'Dont have a account'
//                                           : 'Already have an account'),
//                                       TextButton(
//                                           onPressed: () {
//                                             ref
//                                                 .read(loginProvider.notifier)
//                                                 .toggle();
//                                           },
//                                           child: Text(
//                                               isLogin ? 'Sign Up' : 'Login'))
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         })
//                       ])
//                     ]))));
//   }
// }

import 'package:bookshop/providers/authProvider.dart';
import 'package:bookshop/providers/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BookShop')),
          backgroundColor: Colors.orange,
        ),
        body: Consumer(builder: (context, ref, child) {
          final isLogin = ref.watch(loginProvider);
          //  final isLoad = ref.watch(loadingProvider);
          //  print(isLoad);
          return Form(
              key: _form,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    height: isLogin ? 390 : 560,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          isLogin ? 'Login Form' : 'SignUp Form',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Colors.blueGrey),
                        ),
                        if (isLogin == false)
                          TextFormField(
                            controller: nameController,
                            textCapitalization: TextCapitalization.words,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'username is required';
                              }
                              if (val.length > 30) {
                                return 'maximum user length is 30';
                              }
                              return null;
                            },
                            decoration: InputDecoration(hintText: 'username'),
                          ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'email is required';
                            }
                            if (!val.contains('@')) {
                              return 'please provide valid email address';
                            }
                            return null;
                          },
                          controller: mailController,
                          decoration: InputDecoration(hintText: 'email'),
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'password is required';
                            }
                            if (val.length > 20) {
                              return 'maximum password length is 20';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'password'),
                        ),
                        Container(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              _form.currentState!.save();
                              //  ref.read(loadingProvider.notifier).toggle();
                              FocusScope.of(context).unfocus();
                              if (_form.currentState!.validate()) {
                                if (isLogin) {
                                  final response =
                                      await ref.read(logSignProvider).Login(
                                            email: mailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          );

                                  if (response != 'success') {
                                    ref.read(loginProvider.notifier).toggle();
                                    Get.showSnackbar(GetSnackBar(
                                      duration: Duration(seconds: 1),
                                      title: 'some error occurred',
                                      message: response,
                                    ));
                                  }
                                } else {
                                  final response = await ref
                                      .read(logSignProvider)
                                      .signUp(
                                        userName: nameController.text.trim(),
                                        email: mailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      );

                                  if (response != 'success') {
                                    ref.read(loginProvider.notifier).toggle();
                                    Get.showSnackbar(GetSnackBar(
                                      duration: Duration(seconds: 1),
                                      title: 'some error occurred',
                                      message: response,
                                    ));
                                  }
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(isLogin
                                ? 'Don\'t have account ?'
                                : 'Already have an account ?'),
                            TextButton(
                                onPressed: () {
                                  ref.read(loginProvider.notifier).toggle();
                                },
                                child: Text(isLogin ? 'SignUp' : 'Login'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }
}
