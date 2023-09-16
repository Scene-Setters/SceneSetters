import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/config/constants/app_color_theme.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/rent_view_model.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/share_view_model.dart';

import '../../../../../config/router/app_route.dart';

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

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Function to reload the data when the user triggers a refresh.
  Future<void> _handleRefresh() async {
    // Implement the logic to reload the data here.
    ref.watch(rentViewModelProvider.notifier).getRentedFlats();
    ref.watch(shareViewModelProvider.notifier).getSharedFlats();
  }

  @override
  Widget build(BuildContext context) {
    var rentState = ref.watch(rentViewModelProvider);
    var shareState = ref.watch(shareViewModelProvider);

    if (rentState.isLoading || shareState.isLoading) {
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
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
                text: 'I need a room for rent',
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
            ? RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: _handleRefresh,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                    itemCount: rentState.rentRooms.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.individual,
                              arguments: rentState.rentRooms[index].id,
                            );

                            ref
                                .read(rentViewModelProvider.notifier)
                                .getRentedFlatsById(
                                    rentState.rentRooms[index].id);
                          },
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
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rentState.rentRooms[index].title,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          rentState.rentRooms[index].area,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Hind',
                                            color: Colors.grey,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.bed_outlined,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${rentState.rentRooms[index].capacity} room',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs ${rentState.rentRooms[index].price}',
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Hind',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              ' / month',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Hind',
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .bookmark_outline_outlined),
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
                        ),
                      );
                    },
                  ),
                ),
              )
            : RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: _handleRefresh,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                    itemCount: shareState.shareFlats.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.individual,
                            arguments: shareState.shareFlats[index].id,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
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
                                          'images/movies/inster.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  // Wrap the Column in Expanded
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shareState.shareFlats[index].title,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          shareState.shareFlats[index].area,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Hind',
                                            color: Colors.grey,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.bed_outlined,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${shareState.shareFlats[index].capacity} room',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs ${shareState.shareFlats[index].price}',
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Hind',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              ' / month',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Hind',
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .bookmark_outline_outlined),
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
                        ),
                      );
                    },
                  ),
                ),
              ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () {
              // final movieId = allMovieState.allMovies[0].id;
              // ref.read(movieViewModelProvider.notifier).getMovieDetails(movieId!);
              // Navigator.pushNamed(context, AppRoute.writeReview);
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
