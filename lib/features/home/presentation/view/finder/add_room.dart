import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({
    Key? key, // Remove super.key here
  }) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

TextEditingController title = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController amenitites = TextEditingController();
TextEditingController capacity = TextEditingController();
TextEditingController exactLocation = TextEditingController();
TextEditingController preferences = TextEditingController();

class _AddRoomState extends State<AddRoom> {
  SizedBox gap() {
    return const SizedBox(
      height: 10,
    );
  }

  String? placeName;

  File? _image;

  bool isChecked = false;
  // Track whether the user agreed to terms
  final bool _isObscure = true;
  double? latitude;
  double? longitude; // Define it as nullable

  final pinkey = GlobalKey<FormState>();

  LatLng? selectedLocation;
  Set<Marker> markers = {};

  bool isMapExpanded = false;
  // Function to toggle map expansion
  // void toggleMapExpansion() {
  //   setState(() {
  //     isMapExpanded = !isMapExpanded;
  //   });
  // }

  // Function to perform reverse geocoding
  Future<void> reverseGeocode(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        // Update the "Exact Location" field with coordinates
        setState(() {
          final city = placemarks[0].locality ?? "";
          final area = placemarks[0].subLocality ?? "";
          placeName = "$city, $area"; // Combine city and area
          exactLocation.text =
              "${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}"; // Update placeName
        });
        print(placeName);
      }
    } catch (e) {
      print("Error during reverse geocoding: $e");
    }
  }

  void toggleMapExpansion() async {
    if (isMapExpanded) {
      // Perform reverse geocoding when the map is collapsed
      if (selectedLocation != null) {
        try {
          List<Placemark> placemarks = await placemarkFromCoordinates(
            selectedLocation!.latitude,
            selectedLocation!.longitude,
          );

          if (placemarks.isNotEmpty) {
            // Update the "Exact Location" field with coordinates
            setState(() {
              exactLocation.text =
                  "${selectedLocation!.latitude.toStringAsFixed(6)}, ${selectedLocation!.longitude.toStringAsFixed(6)}";
              placeName = placemarks[0].name; // Update placeName
            });
            print(placeName);
          }
        } catch (e) {
          print("Error during reverse geocoding: $e");
        }
      }
    }

    setState(() {
      isMapExpanded = !isMapExpanded;
    });
  }
// Function to perform reverse geocoding
  // Future<void> reverseGeocode() async {
  //   if (selectedLocation != null) {
  //     try {
  //       List<Placemark> placemarks = await placemarkFromCoordinates(
  //         selectedLocation!.latitude,
  //         selectedLocation!.longitude,
  //       );

  //       if (placemarks.isNotEmpty) {
  //         // Update the address and location text fields
  //         setState(() {
  //           address.text = placemarks[0].street ?? '';
  //           location.text = placemarks[0].locality ?? '';
  //         });
  //       }
  //     } catch (e) {
  //       print("Error during reverse geocoding: $e");
  //     }
  //   }
  // }

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
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource
                                  .gallery); // You can use ImageSource.camera for the camera

                          if (image != null) {
                            setState(() {
                              // Assign the selected image to the _image variable
                              _image = File(image.path);
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.4,
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
                                        Text(
                                          'Tap to add a photo',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: color,
                          ),
                          child: TextFormField(
                            key: const ValueKey('address'),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Please enter address';
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: color,
                          ),
                          child: TextFormField(
                            key: const ValueKey('location'),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Please enter location';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'Location',
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
                    ),
                  ],
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
                      key: const ValueKey('exact location'),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter a exact location';
                        }
                        return null;
                      },
                      maxLines: null,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Exact location',
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
                      key: const ValueKey('amenities'),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter a amenities';
                        }
                        return null;
                      },
                      maxLines: null,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'amenities',
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
                      key: const ValueKey('capacity'),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter a capacity';
                        }
                        return null;
                      },
                      maxLines: null,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'capacity',
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

                // Map for selecting location
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: color,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey('preferences'),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter your preferences ';
                            }
                            return null;
                          },
                          maxLines: null,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Preference',
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
                        // Add some spacing
                      ],
                    ),
                  ),
                ),

                if (selectedLocation != null)
                  Text(
                    'Latitude: ${selectedLocation!.latitude.toStringAsFixed(6)}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                if (selectedLocation != null)
                  Text(
                    'Longitude: ${selectedLocation!.longitude.toStringAsFixed(6)}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                if (placeName != null)
                  Text(
                    'Place Name: $placeName',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                gap(),
                SizedBox(
                  height: isMapExpanded ? screenHeight : 200,
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target:
                              LatLng(27.7172, 85.3240), // Kathmandu coordinates
                          zoom: 15, // Set the initial zoom level
                        ),
                        markers: markers,
                        onTap: (LatLng position) {
                          // When the user taps on the map, update the selected location and perform reverse geocoding
                          setState(() {
                            selectedLocation = position;
                            markers.clear();
                            markers.add(Marker(
                              markerId: const MarkerId('selectedLocation'),
                              position: selectedLocation!,
                            ));
                          });

                          // Call reverse geocoding function
                          reverseGeocode(position);
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: toggleMapExpansion,
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            // decoration: BoxDecoration(
                            //   color: Colors.blue,
                            //   borderRadius: BorderRadius.circular(28),
                            // ),
                            child: Icon(
                              isMapExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            )),
      ),
    );
  }
}
