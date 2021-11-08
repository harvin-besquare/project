// ignore_for_file: camel_case_types, avoid_print, prefer_const_constructors, unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:final_project/info.dart';
import 'package:final_project/cubit/main_cubit.dart';
import 'package:final_project/homepost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/postdetails': (context) => PostDetails(
              url: '',
              name: '',
              title: '',
              description: '',
            ),
      },
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) => MainCubit(),
        child: signInPage(),
      ),
    );
  }
}

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<signInPage> {
  TextEditingController username = TextEditingController();
  final channel =
      IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: Text(
                'Project',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
                    child: Container(
                      child: TextFormField(
                        controller: username,
                        decoration: const InputDecoration(
                          labelText: 'Enter your Username',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      (username.text.isEmpty)
                          ? {print('username is empty')}
                          : {
                              _signInUser(),
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          PostPage(channel: channel)))
                            };
                    },
                    child: const Text(
                      'Enter to the App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signInUser() {
// Sending user sign in request
    context.read<MainCubit>().login(username.text);
  }
}
