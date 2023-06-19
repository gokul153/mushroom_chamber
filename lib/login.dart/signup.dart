import 'package:b_green/login.dart/Authcontroller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:mine/login/front.dart';
//import 'signin.dart';
//import 'package:mine/login/signin.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:project/authcontroller.dart';
//import 'package:work_gokul/pages/loginpage1.dart';
import 'package:get/get.dart';

class Createacc extends StatefulWidget {
  const Createacc({super.key});

  @override
  State<Createacc> createState() => _CreateaccState();
}

class _CreateaccState extends State<Createacc> {
  //final _username = TextEditingController();
  //final _lastname = TextEditingController();
  //var emailcontroller = TextEditingController();
  // var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
        leading: IconButton(
            onPressed: () {
              /*       Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const FrontPage()));*/
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        elevation: 0,
      ), // Color.fromARGB(255, 40, 49, 27),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 85, 139, 47),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/farmer.png',
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                          width: 90.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "CREATE YOUR ACCOUNT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 85, 139, 47),
                                    blurRadius: 10,
                                    offset: Offset(2, 5))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: "First Name",
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.mail),
                                      hintText: "Email ID",
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.key,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99)),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Sign up is intialted");
                            AuthController.instance.register(
                                emailController.text.trim(),
                                passwordController.text);
                            /* user_add = 0;
                    user = _username.text + _lastname.text;
                    print(user);
                    Authcontroller.instance.Register(emailcontroller.text.trim(),
                        passwordcontroller.text.trim());
        
                    print("username $user , update  user $user_add");
                    if (user_add == 1) {
                      final snackBar = SnackBar(
                        content: Text('User succesfull Created go to Login!'),
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //  navigatewelcome();
                    }*/
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 85, 139, 47),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(160, 85, 139, 47),
                                      blurRadius: 5,
                                      offset: Offset(2, 5))
                                ]),
                            child: const Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: 'Have an account? Sign In',
                            style: const TextStyle(
                                color: Color.fromARGB(160, 85, 139, 47),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
