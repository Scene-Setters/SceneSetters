import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
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
                      Icons.pin_drop_rounded,
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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 7, right: 8),
                child: TextFormField(
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
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'I need a shared room'),
              Tab(
                text: 'I need to rent',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
