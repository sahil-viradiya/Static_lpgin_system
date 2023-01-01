// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/home_screen.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();

  String? email_value,password_value,error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey ,
          child: Column(
            children: [
              Image.network(
                  "https://i.pinimg.com/736x/de/a0/f3/dea0f3b7f480b1151c08db4a402a43b9.jpg"),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter email";
                  }
                  email_value = value;

                },
                decoration: InputDecoration(
                    hintText: "Enter email",
                    label: Text("Email address"),
                    prefixIcon: Icon(Icons.email)),
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter password";
                  }
                  password_value = value;

                },
                decoration: InputDecoration(
                    hintText: "Enter password",
                    label: Text("password"),
                    prefixIcon: Icon(Icons.lock)),
              ),
              if(error!=null) Text(error!),
              ElevatedButton(onPressed: () {

                if(formkey.currentState!.validate()){
                  LoginStates response = login(email: email_value!, password: password_value!);
                  if(response==LoginStates.LOGIN_SUCCESS){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                  }else{
                    setState(() {
                      error = "Login Failed";
                    });
                  }

                }


              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
