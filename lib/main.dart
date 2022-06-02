import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:VCAPTCHA/screens/register.dart';
import 'package:VCAPTCHA/module/connection_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: homeroute());
  }
}

class homeroute extends StatefulWidget {
  homeroute({Key? key}) : super(key: key);

  @override
  State<homeroute> createState() => _homerouteState();
}

class _homerouteState extends State<homeroute> {
  final email = TextEditingController();
  final passwd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('VCAPTCHA'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Container(
                  width: 250,
                  child: Image(image: const AssetImage('images/logo.png'))),
              Container(
                width: double.infinity,
                child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Username',
                    )),
              ),
              Container(
                width: double.infinity,
                child: TextField(
                    controller: passwd,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    )),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      var rs = await connect_login(email.text, passwd.text);

                      var message = {rs['message']};
                      var token = {rs['token']};
                       
                     
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(message.toString()),
                          );
                        },
                      );
                    },
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                  child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const register()),
                      );
                    },
                  ))
            ],
          ),
        )),
      ),
    );
    ;
  }
}
