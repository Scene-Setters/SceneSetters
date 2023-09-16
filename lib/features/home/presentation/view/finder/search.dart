import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/search_view_model.dart';

import '../../../../../config/constants/app_color_theme.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String searchText = '';
  List<String> recentSearches = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Function to reload the data when the user triggers a refresh.

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;

    final searchStat = ref.watch(searchViewModelProvider);

    print(searchStat.searchFlats.length);
    return Scaffold(
      backgroundColor: AppColors.appbarColors,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.appbarColors,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            centerTitle: false,
            toolbarHeight: isTablet ? 100 : 60.0,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 15, 5),
              child: Text(
                'SEARCH',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: isTablet ? 45 : 25,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              elevation: 2,
              backgroundColor: AppColors.appbarColors,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.0),
                ),
              ),
              toolbarHeight: 70,
              title: Padding(
                padding: const EdgeInsets.only(top: 20, left: 7, right: 8),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                      ref
                          .watch(searchViewModelProvider.notifier)
                          .getSearchByAddress(searchText);
                    });
                  },
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                    filled: true,
                    fillColor: const Color(0xffEAE9EC),
                    hintText: 'Search address, city, location',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(2, 12, 8, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 75.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount:
                    searchText.isEmpty ? 1 : searchStat.searchFlats.length,
                (context, index) {
                  if (searchText.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          'Your Searches Will Appear Here',
                          style: TextStyle(
                            fontSize: isTablet ? 25 : 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    );
                  } else if (index < searchStat.searchFlats.length) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.bodyColors,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Container(
                              height: isTablet ? 150 : 100,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    isTablet ? 30.0 : 10.0),
                                border: Border.all(color: Colors.black),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    isTablet ? 30.0 : 10.0),
                                child: const Image(
                                  image: AssetImage(
                                      'images/backgrounds/noInfo.png'),
                                ),
                              ),
                            ),
                            title: Text(
                              searchStat.searchFlats[index].title,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: isTablet ? 30 : 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
