import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sajhasync/config/router/app_route.dart';
import 'package:sajhasync/core/common/snackbar/my_snackbar.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/share_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../config/constants/app_color_theme.dart';
import '../../../home/presentation/viewmodel/rent_view_model.dart';

class IndividualView extends ConsumerStatefulWidget {
  const IndividualView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndividualViewState();
}

class _IndividualViewState extends ConsumerState<IndividualView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rentViewModelProvider.notifier).getRentedFlats();
      ref.read(shareViewModelProvider.notifier).getSharedFlats();
    });
    super.initState();
  }

  bool _showVideoPlayer = false;

  final YoutubePlayerController _youtubeController = YoutubePlayerController(
    initialVideoId: 'KW2MVMj5ke8',
    flags: const YoutubePlayerFlags(
      autoPlay: true, // Auto-play the video when the page is opened
    ),
  );

  @override
  Widget build(BuildContext context) {
    var screenState = ref.watch(rentViewModelProvider);

    if (screenState.isLoading) {
      return Scaffold(
        body: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: const AlwaysStoppedAnimation(0.0),
                curve: Curves.linear,
              ),
            ),
            child: CircularProgressIndicator(
              color: AppColors.bodyColors,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                expandedHeight: constraints.maxHeight * 0.4,
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: _showVideoPlayer
                      ? YoutubePlayer(
                          controller: _youtubeController,
                          showVideoProgressIndicator: true,
                        )
                      : screenState.rentRoomsByUserId[0].photos == ''
                          ? Image.asset(
                              'images/backgrounds/rent.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              screenState.rentRoomsByUserId[0].photos!,
                              fit: BoxFit.cover,
                            ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Buttons to navigate to TIPS and RECOMMENDATIONS sections
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showVideoPlayer = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue.withOpacity(0.7),
                              backgroundColor: Colors.black.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(color: Colors.black),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 100),
                            ),
                            child: const Text(
                              'Watch the video',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Hind',
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: Text(
                                  screenState.rentRoomsByUserId[0].title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    // color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              const Icon(Icons.pin_drop, color: Colors.blue),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  screenState.rentRoomsByUserId[0].city,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              const Icon(Icons.bed, color: Colors.blue),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${screenState.rentRoomsByUserId[0].capacity} rooms',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 22, right: 20, top: 10, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              screenState.rentRoomsByUserId[0].description,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 8, left: 20, right: 20),
                          child: Opacity(
                            opacity: 0.2,
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 20, right: 20),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 25.0, // Adjust the radius as needed
                                backgroundImage: AssetImage(
                                    'images/movies/bansheerin.jpg'), // Replace with your image URL
                              ),

                              const SizedBox(
                                  width:
                                      10.0), // Add spacing between the image and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    screenState.rentRoomsByUserId[0].owner!
                                        .fullname, // Replace with the profile name
                                    style: const TextStyle(
                                      fontSize:
                                          15.0, // Adjust the font size as needed
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          3.0), // Add spacing between name and profession
                                ],
                              ),
                            ],
                          ),
                        ),
                        screenState.rentRoomsByUserId[0].isPaid == true
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 26, top: 15, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Contact Number',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        screenState.rentRoomsByUserId[0].owner!
                                            .phoneNumber,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Exact Location',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        screenState.rentRoomsByUserId[0].area,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'House Facilities', // Replace with the profile name
                                        style: TextStyle(
                                          fontSize:
                                              18.0, // Adjust the font size as needed
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.house_sharp),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        screenState
                                            .rentRoomsByUserId[0].amenities
                                            .join(
                                                ', '), // Replace with the profile name
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins',
                                          overflow: TextOverflow
                                              .ellipsis, // Adjust the font size as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs. ${screenState.rentRoomsByUserId[0].price} / month', // Replace with the profile name
                                style: const TextStyle(
                                  fontSize:
                                      15.0, // Adjust the font size as needed
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              screenState.rentRoomsByUserId[0].isPaid == true
                                  ? const SizedBox(
                                      width: 0,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ref
                                              .watch(rentViewModelProvider
                                                  .notifier)
                                              .visitRooms(screenState
                                                  .rentRoomsByUserId[0].id!);

                                          showSnackBar(
                                              message:
                                                  'Your payment was succesful',
                                              context: context);
                                          Navigator.popAndPushNamed(
                                              context, AppRoute.dashRoute);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation:
                                              50, // Set the text color with reduced opacity
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                        ),
                                        child: const Text(
                                          'Reveal details',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 8, left: 20, right: 20),
                          child: Opacity(
                            opacity: 0.2,
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                        screenState.rentRoomsByUserId[0].isPaid == true
                            ? const SizedBox(
                                height: 200, // Adjust the height as needed
                                child: MapWidget(
                                  latitude: 27.716826,
                                  longitude: 85.327432,
                                ),
                              )
                            : Container(),
                        screenState.rentRoomsByUserId[0].isPaid == true
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 10, bottom: 15, right: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Please visit the property and meet the owner in person before renting. Your safety is paramount, so exercise caution, conduct due diligence, and report any concerns to us promptly. Thank you for using SajhaSync!!",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapWidget({super.key, required this.latitude, required this.longitude});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
          final LatLng location = LatLng(widget.latitude, widget.longitude);
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(location, 14.0),
          );
        });
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.latitude, widget.longitude),
        zoom: 14.0,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('staticMarker'),
          position: LatLng(widget.latitude, widget.longitude),
          infoWindow: const InfoWindow(title: 'Static Location'),
        ),
      },
    );
  }
}
