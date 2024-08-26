import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      title: 'Instagram Sign In',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
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
      appBar: 
      AppBar(
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back_ios))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white60,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pic.png',
                  fit: BoxFit.contain,
                  height:200 ,
                  width: 200,
                ),
                SizedBox(height: 48),

                Container(
                  color: Colors.grey[300],
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                Container(
                  color: Colors.grey[300],
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

                //text button
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Sign Up page
                    },
                    child: Text('Forgot password? '),
                  ),
                ),

                SizedBox(height: 14),
                //sign in button
                ElevatedButton(
                  onPressed: () {
                    // Handle sign in logic here
                  },
                  child: Text('Sign In',
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
                Text("________________________________ OR ________________________________"),

                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Sign Up page
                      },
                      child: Text('Login with facebook',
                        style:TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                BottomAppBar(
                  child:
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top:
                        BorderSide(color: Colors.black,width: 1
                        ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t you have account?'),
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign Up page
                            },
                            child: Text('Sign up',
                              style:TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
