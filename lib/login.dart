import 'package:flutter/material.dart';
import 'package:kadamcounter/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Kadam Counter',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff111328),
      ),
      body: Container(
        color: Color(0xff111328),
        child: Column(
          children: <Widget>[
            Container(
                child: Image.asset(
              'assets/s.png',
              height: MediaQuery.of(context).size.height * 0.40,
            )),
            Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )),
            Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 13),
              child: Row(
                children: [
                  Container(
                      child: Icon(
                    Icons.email,
                    color: Colors.white,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Expanded(
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          iconColor: Colors.white,
                          hintText: "Enter email address",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Container(
                      child: Icon(
                    Icons.lock,
                    color: Colors.white,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Expanded(
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Enter password ",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.90,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.width * 0.13,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {
                            print(emailController.text);
                            print(passwordController.text);
                          },
                        )),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Does not have account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
