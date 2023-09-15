import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';

class RegisterViews extends ConsumerStatefulWidget {
  const RegisterViews({super.key});

  @override
  ConsumerState<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends ConsumerState<RegisterViews> {
  bool _isObscure = true;
  final bool _isObscure1 = true;
  final registerkey = GlobalKey<FormState>();

  SizedBox gap() {
    return const SizedBox(
      height: 5.0,
    );
  }

  SizedBox gapa() {
    return const SizedBox(
      height: 25.0,
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authState = ref.watch(authViewModelProvider);

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
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: double.infinity,
        color: const Color(0xffF8F8F8),
        child: Form(
          key: registerkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 28.0,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    },
                    alignment: Alignment.topLeft,
                  ),
                ),
                const AspectRatio(
                  aspectRatio: 12 / 4,
                  child: Image(
                    image: AssetImage('images/backgrounds/sajhasync.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // gap(),
                padds(
                  'REGISTER',
                  40.0,
                  1.5,
                  const Color(0xff001118),
                  20,
                  0,
                  20,
                  0,
                  0,
                  FontWeight.bold,
                ),
                padds(
                  'Full Name',
                  35.0,
                  1.0,
                  Colors.black,
                  20,
                  10,
                  0,
                  0,
                  0,
                  FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    controller: fullname,
                    validator: (text) {
                      if (text == null) {
                        return 'Please enter fullname';
                      }
                      if (text.isEmpty) {
                        return 'Enter an fullname';
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
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.00, 15.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your fullname',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                gap(),
                padds(
                  'Phone No',
                  35.0,
                  1.0,
                  Colors.black,
                  20,
                  10,
                  0,
                  0,
                  0,
                  FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    controller: phone,
                    validator: (text) {
                      if (text == null) {
                        return 'Please enter phone number';
                      }
                      if (text.isEmpty) {
                        return 'Enter a phone number';
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
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.00, 15.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your phone number',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                  ),
                ),
                gap(),
                padds(
                  'Age',
                  35.0,
                  1.0,
                  Colors.black,
                  20,
                  10,
                  0,
                  0,
                  0,
                  FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    controller: age,
                    validator: (text) {
                      if (text == null) {
                        return 'Please enter your age';
                      }
                      if (text.isEmpty) {
                        return 'Enter an age';
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
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.00, 15.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your age',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                  ),
                ),
                gap(),
                padds(
                  'Email',
                  35.0,
                  1.0,
                  Colors.black,
                  20,
                  10,
                  0,
                  0,
                  0,
                  FontWeight.w500,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
                    controller: email,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter an email';
                      }
                      const emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      if (!RegExp(emailPattern).hasMatch(text)) {
                        return 'Invalid email format';
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
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.00, 15.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),

                gap(),
                padds(
                  'Password',
                  35.0,
                  1.0,
                  Colors.black,
                  20,
                  10,
                  0,
                  0,
                  0,
                  FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextFormField(
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
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.00, 15.0),
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
                gap(),
                gapa(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 65.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (registerkey.currentState!.validate()) {
                          // var user = UserEntity(
                          //   fullname: fullname.text,
                          //   email: email.text,
                          //   password: password.text,
                          //   confirmPassword: confirmpass.text,
                          // );
                          // ref
                          //     .read(authViewModelProvider.notifier)
                          //     .registerUser(context, user);
                        }
                      },
                      child: const Text(
                        'REGISTER',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
