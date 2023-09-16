import 'dart:io';

import 'package:flutter/material.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({
    super.key,
  });

  @override
  State<AddRoom> createState() => _AddRoomState();
}

TextEditingController title = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController description = TextEditingController();

class _AddRoomState extends State<AddRoom> {
  SizedBox gap() {
    return const SizedBox(
      height: 10,
    );
  }

  File? _image;

  bool isChecked = false;
  // Track whether the user agreed to terms
  final bool _isObscure = true;

  final pinkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String hexColor = "#E5E5E5";
    Color color =
        Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 250,
                      ),
                    ],
                  ),
                  gap(),
                  const Column(
                    children: [
                      Text(
                        'List new room/flats ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'List in the market where listers are waiting ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: pinkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                  ),
                  child: TextFormField(
                    key: const ValueKey('title'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter property title ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Property title',
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 16, 16, 16),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              gap(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                  ),
                  child: TextFormField(
                    key: const ValueKey('price'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter the price ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'price',
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 16, 16, 16),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              gap(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                  ),
                  child: TextFormField(
                    key: const ValueKey('address'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter address and location';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Address',
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 16, 16, 16),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              gap(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                  ),
                  child: TextFormField(
                    key: const ValueKey('location'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter address and location';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'location',
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 16, 16, 16),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              gap(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                  ),
                  child: TextFormField(
                    key: const ValueKey('description'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    maxLines: null,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 16, 16, 16),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              gap(),
              gap(),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: _image == null
                            ? const Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add_a_photo,
                                        size: 80,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 16.0),
                                    ],
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              gap(),
              gap(),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Text('I agree to the terms and conditions'),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.green,
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
              gap(),
              gap(),
              gap(),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
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
