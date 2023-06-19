import 'package:b_green/login.dart/Authcontroller.dart';
import 'package:b_green/login.dart/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:mine/login/signup.dart';
//import 'package:mine/login/front.dart';
//import 'package:flutter_progress_hud/flutter_progress_hud.dart';
//import 'package:mine/bottomnav.dart';
import 'package:get/get.dart';

var user = "";

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  bool isApicallprocess = false;
  // ignore: non_constant_identifier_names
  bool hide_password = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: globalFormKey,
          child: _loginui(context),
        ),
      ),
    );
  }

  Widget _loginui(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 85, 139, 47),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            height: 40.0,
                            width: 40.0,
                            child: IconButton(
                                onPressed: () {
                                  /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              const FrontPage()));*/
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/farmer.png',
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                          width: 100.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      //height: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.68,
                      //margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: const TextSpan(
                                  text: "WELCOME!",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 85, 139, 47),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 85, 139, 47),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color:
                                              Color.fromARGB(255, 85, 139, 47),
                                        ),
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        hintText: "Enter your Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                        //  errorText: "enter valid_email"
                                        ),
                                    style: const TextStyle(color: Colors.black),
                                    validator: (email) {
                                      print("enter valid email");
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 85, 139, 47),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: TextFormField(
                                      scrollPadding: const EdgeInsets.all(10.0),
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.password_outlined,
                                            color: Color.fromARGB(
                                                255, 85, 139, 47),
                                          ),
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText: "Password",
                                          border: InputBorder.none),
                                      obscureText: true,
                                      validator: (password) {
                                        return null;
                                      }),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AuthController.instance.login(
                                        _emailController.text.trim(),
                                        _passwordController.text);
                                    /*   Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                const BottomPage(
                                                    //  remail: '',
                                                    )));*/
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 200,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 85, 139, 47),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Don't have an account?",
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 85, 139, 47),
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: " Sign Up!",
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 85, 139, 47),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => Get.to(
                                                  () => const Createacc())
                                           
                                            ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
