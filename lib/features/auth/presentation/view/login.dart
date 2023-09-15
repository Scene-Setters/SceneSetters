import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';

class LoginViews extends ConsumerStatefulWidget {
  const LoginViews({super.key});

  @override
  ConsumerState<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends ConsumerState<LoginViews> {
  bool _isObscure = true;
  final pinkey = GlobalKey<FormState>();

  SizedBox gap() {
    return const SizedBox(
      height: 15.0,
    );
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget padds(
        String title,
        double fonts,
        double letters,
        Color textcolor,
        double left,
        double right,
        double top,
        double bottom,
        double wordSpace,
        FontWeight weight) {
      return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: fonts,
            fontWeight: weight,
            letterSpacing: letters,
            wordSpacing: wordSpace,
            color: textcolor,
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.infinity,
        color: const Color(0xffF8F8F8),
        child: Form(
          key: pinkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                gap(),
                const AspectRatio(
                  aspectRatio: 10 / 4,
                  child: Image(
                    image: AssetImage('images/backgrounds/sajhasync.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                gap(),
                padds('LOGIN', 40.0, 1.5, const Color(0xff001118), 20, 0, 20, 0,
                    0, FontWeight.bold),
                gap(),
                padds('Username', 35.0, 1.0, Colors.black, 20, 10, 0, 0, 0,
                    FontWeight.w500),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    key: const ValueKey('username'),
                    controller: username,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      contentPadding:
                          const EdgeInsets.fromLTRB(25.0, 20.0, 25.00, 20.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your username',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                gap(),
                padds('Password', 35.0, 1.0, Colors.black, 20, 10, 0, 0, 0,
                    FontWeight.w500),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    key: const ValueKey('password'),
                    obscureText: _isObscure,
                    controller: password,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (text.length < 8) {
                        return 'Password should be at least 8 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.fromLTRB(25.0, 20.0, 25.00, 20.0),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      suffixIcon: Align(
                        widthFactor: 1.5,
                        heightFactor: 1.0,
                        child: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 65.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (pinkey.currentState!.validate()) {
                          // await ref
                          //     .read(authViewModelProvider.notifier)
                          //     .loginUser(
                          //       context,
                          //       username.text,
                          //       password.text,
                          //       // ref,
                          //     );
                          Navigator.popAndPushNamed(
                              context, AppRoute.dashboardRoute);
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontFamily: 'Dongle',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                  ),
                ),
                gap(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Dongle',
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                          // wordSpacing: 0.8,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.registerRoute);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Dongle',
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.9,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
