// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/homeScreen.dart';
import 'package:movie_app/screens/login/signUp.dart';
import 'package:movie_app/screens/login/user_auth/firebase_auth_service.dart';
import 'package:movie_app/theme/appTheme.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String routeName = "/loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FirbaseAuthServices _auth = FirbaseAuthServices();
  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "Log in",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(
                flex: 1,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildCustomTextForm(
                      hintTxt: "enter your email",
                      icon: Icons.person,
                      color: AppTheme.whiteColor,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildCustomTextForm(
                      hintTxt: "enter your password",
                      icon: Icons.lock,
                      color: AppTheme.whiteColor,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60),
                          backgroundColor: AppTheme.redLightColor,
                          foregroundColor: AppTheme.whiteColor),
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.whiteColor,
                                foregroundColor: AppTheme.backgroundColor),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  width: 25,
                                ),
                                Text(
                                  "Google  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.whiteColor,
                                foregroundColor: AppTheme.backgroundColor),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/facebook.png",
                                  width: 25,
                                ),
                                Text(
                                  "Facebook",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account?",
                          style: TextStyle(color: AppTheme.whiteColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpPage.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: AppTheme.redLightColor),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildCustomTextForm(
      {required String hintTxt,
      IconData? icon,
      required Color color,
      required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintTxt,
          hintStyle: TextStyle(color: color)),
    );
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.loginWithEmailAndPassword(email, password);
    if (user != null) {
      print("login succesfully");
      Navigator.pushNamed(context, HomeScreen.routeName);
    } else {
      print("Error");
    }
  }
}
