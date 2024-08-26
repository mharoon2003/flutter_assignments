import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login_page_Instagram1.dart';




const imageSrc = 'assets/images/pic3.jpg';
const facebookLogoSrc = 'assets/images/facebooklogo.png';
const twitterLogoSrc = 'assets/images/twitterlogo.png';
const googleLogoSrc = 'assets/images/google.png';
bool _showPassword = false;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));

}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _ZappyChatState();
}

class _ZappyChatState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(14),
             side: BorderSide(
               color: Colors.deepPurpleAccent,
               width: 12
             )
           ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(imageSrc))),
                Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                txtField(iconData: Icons.mail, txt: 'Name'),
                txtField(
                    iconData: Icons.key,
                    txt: 'Password',
                    hasEye: true),
                forgotPasswordSection('Forgot Password'),
                buildElevatedLoginButton(
                    txt: 'LOGIN',
                    backgroundColor: const Color.fromARGB(20, 57, 63, 198)),
                makeOrSection,
                rowSection,
                bottomPart,
              ],
            ),
          ),
        ),
      );
  }

  Widget get rowSection {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        rowSectionChild(childSrc: facebookLogoSrc),
        rowSectionChild(childSrc: googleLogoSrc),
        rowSectionChild(childSrc: twitterLogoSrc),
      ],
    );
  }

  Container rowSectionChild({required String childSrc}) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black, blurRadius: 30, blurStyle: BlurStyle.normal)
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  InstagramSignInPage(),
                ));
          });
        },
        child: CircleAvatar(
          radius: double.infinity,
          backgroundImage: AssetImage(
            childSrc,
          ),
        ),
      ),
    );
  }

  Padding get makeOrSection {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
           const Expanded(
            child: Divider(
              color: Colors.blueGrey,
              endIndent: 10,
              indent: 70,
              thickness: 1,
            ),
          ),
          Text(
            'Or',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: Divider(
              color: Colors.blueGrey,
              height: 20,
              thickness: 1,
              endIndent: 90,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget get bottomPart {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register now using',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.indigo,
                padding: const EdgeInsets.all(5),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Email'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildElevatedLoginButton(
      {required txt, Color? foregroundColor, Color? backgroundColor}) {
    return SizedBox(
      width: 230,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InstagramSignInPage()));
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(390, 50),
          minimumSize: const Size(200, 50),
          maximumSize: const Size(400, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(txt),
      ),
    );
  }

  Widget txtField(
      {required String txt, bool hasEye = false, required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: TextField(
        obscureText: hasEye ? _showPassword : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 3, color: Colors.blue.shade900)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 3, color: Colors.blue.shade900)),
          prefixIcon: Icon(
            iconData,
            color: Colors.white,
          ),
          suffixIcon: hasEye
              ? GestureDetector(
                  onTap: () => setState(() {
                    _showPassword = !_showPassword;
                  }),
                  child: Icon(
                    _showPassword
                        ? Icons.remove_red_eye
                        : Icons.looks,
                    color: Colors.white,
                  ),
                )
              : null,
          label: Text(
            txt,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          filled: true,
          fillColor: Colors.blueAccent.shade700,
        ),
      ),
    );
  }

  Widget forgotPasswordSection(String txt) {
    return TextButton(
      onPressed: () {},
      child: Text(
        txt,
        style: TextStyle(
            color: Colors.blueAccent.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }
}
