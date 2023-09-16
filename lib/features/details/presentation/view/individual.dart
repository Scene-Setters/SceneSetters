import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';

class IndividualView extends ConsumerStatefulWidget {
  const IndividualView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndividualViewState();
}

class _IndividualViewState extends ConsumerState<IndividualView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  // List<ShareEntity> sharedFlats;

  // @override
  // void didChangeDependencies() {
  //   sharedFlats =
  //       ModalRoute.of(context)!.settings.arguments as List<ShareEntity>;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
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
                // shape: const ContinuousRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(100.0),
                //     bottomRight: Radius.circular(100.0),
                //   ),
                // ),
                flexibleSpace: const FlexibleSpaceBar(
                  background: Image(
                    image: AssetImage('images/movies/bansheerin.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                // actions: <Widget>[
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
                              Navigator.pushNamed(
                                  context, AppRoute.dashboardRoute);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue.withOpacity(0.7),
                              backgroundColor: Colors.black.withOpacity(0.2),
                              elevation:
                                  50, // Set the text color with reduced opacity
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
                        const Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: Text(
                                  'Descritpiom',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Hind',
                                    // color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.pin_drop, color: Colors.blue),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Kathmandu, Nepal',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Hind',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.bed, color: Colors.blue),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '2 rooms',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Hind',
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

                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 20, right: 20),
                          child: const Row(
                            children: [
                              CircleAvatar(
                                radius: 25.0, // Adjust the radius as needed
                                backgroundImage: AssetImage(
                                    'images/movies/bansheerin.jpg'), // Replace with your image URL
                              ),
                              SizedBox(
                                  width:
                                      10.0), // Add spacing between the image and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nischal Bista', // Replace with the profile name
                                    style: TextStyle(
                                      fontSize:
                                          15.0, // Adjust the font size as needed
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Hind',
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          3.0), // Add spacing between name and profession
                                  Text(
                                    'House owner', // Replace with the profession
                                    style: TextStyle(
                                      fontSize:
                                          12.0, // Adjust the font size as needed
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: const Column(
                                children: [
                                  Padding(
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
                                          fontFamily: 'Hind',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.water_drop),
                                      Text(
                                        '24 hrs water', // Replace with the profile name
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontFamily:
                                              'Hind', // Adjust the font size as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.kitchen),
                                      Text(
                                        'Kitchen', // Replace with the profile name
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontFamily:
                                              'Hind', // Adjust the font size as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.local_parking_rounded),
                                      Text(
                                        'Free Parking', // Replace with the profile name
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontFamily:
                                              'Hind', // Adjust the font size as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.network_cell),
                                      Text(
                                        'Free Wifi', // Replace with the profile name
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontFamily:
                                              'Hind', // Adjust the font size as needed
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
                              const Text(
                                'Rs.12000 / month', // Replace with the profile name
                                style: TextStyle(
                                  fontSize:
                                      15.0, // Adjust the font size as needed
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Hind',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRoute.dashboardRoute);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation:
                                        50, // Set the text color with reduced opacity
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                  ),
                                  child: const Text(
                                    'Visit for details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Hind',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Divider
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
