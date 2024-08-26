import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(InstagramSignInPage());
}

class InstagramSignInPage extends StatefulWidget {
  @override
  State<InstagramSignInPage> createState() => _InstagramSignInPageState();
}

class _InstagramSignInPageState extends State<InstagramSignInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}


class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/pic2.png',
                      ),
                    fit: BoxFit.cover
                  )
                ),
              ),
        
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.1),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: TextField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(

                      icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
        


              SizedBox(height: 14),
              //sign in button
              ElevatedButton(
                onPressed: () {
                  // Handle sign in logic here
                },
                child: Text('Log In',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ) ,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 22),
                  textStyle: TextStyle(fontSize: 16,),
                ),
              ),

              //sized box
              SizedBox(
                height: 12,
              ),

              //text button
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Navigate to Sign Up page
                  },
                  child: Text('Forgot password? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.blue,
                  ),),
                ),
              ),

              SizedBox(
                height: 12,
              ),


              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Navigate to Sign Up page
                  },
                  child: Text('Back ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.blue,
                    ),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("________________________________ OR ________________________________"),
        
              SizedBox(height: 16,),

              ElevatedButton(
                onPressed: () {
                  // Handle sign in logic here
                },
                child: Text('Create new account',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ) ,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 22),
                  textStyle: TextStyle(fontSize: 16,),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
