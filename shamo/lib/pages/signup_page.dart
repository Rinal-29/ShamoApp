import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        setState(() {
          isLoading = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.greenAccent,
              content: Text(
                'Register Berhasil!',
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/home'),
        );
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: Text(
                'Register Gagal',
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                  fontSize: 24.0, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Register and Happy Shopping',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16.0, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/name_icon.png',
                      width: 17.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style:
                  primaryTextStyle.copyWith(fontSize: 16.0, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/username_icon.png',
                      width: 17.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: usernameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Adress',
              style:
                  primaryTextStyle.copyWith(fontSize: 16.0, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/email_icon.png',
                      width: 17.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 16.0, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/password_icon.png',
                      width: 17.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account ?',
              style: subtitleTextStyle.copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sign In',
                style: purpleTextStyle.copyWith(
                  fontSize: 12.0,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              nameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
