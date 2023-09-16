import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/config/constants/app_color_theme.dart';
import 'package:sajhasync/config/router/app_route.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  SizedBox gap() {
    return const SizedBox(
      height: 10,
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Your current location',
                  style: TextStyle(
                    fontFamily: 'Hind',
                    fontSize: 15,
                  ),
                ),
              ),
              gap(),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.room,
                      color: Color(0xff0a8cd6),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Adarshangar, Kapan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'I need a shared room'),
              Tab(
                text: 'I need a rented room',
              ),
            ],
            onTap: (index) {
              // Update the selected tab index when a tab is tapped
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        body: selectedIndex == 0
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 180,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'images/movies/bansheerin.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              // Wrap the Column in Expanded
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Double Room with great view of bagmati',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Text(
                                      'Kapan',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Hind',
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bed_outlined,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '2 room',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'Rs 12000',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ' / month',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Hind',
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.bookmark_outline_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 180,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                child: Image(
                                  image: AssetImage('images/movies/inster.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              // Wrap the Column in Expanded
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Double Room with great view of bagmati',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Text(
                                      'Kapan',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Hind',
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bed_outlined,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '2 room',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'Rs 12000',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ' / month',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Hind',
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.bookmark_outline_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () {
              // final movieId = allMovieState.allMovies[0].id;
              // ref.read(movieViewModelProvider.notifier).getMovieDetails(movieId!);
              Navigator.pushNamed(context, AppRoute.askPost);
            },
            backgroundColor: AppColors.bodyColors,
            heroTag: null,
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 22,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
