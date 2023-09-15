import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookMarked extends ConsumerStatefulWidget {
  const BookMarked({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookMarkedState();
}

class _BookMarkedState extends ConsumerState<BookMarked> {
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
          toolbarHeight: 80,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Color(0xff0a8cd6),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Favorites',
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
              Tab(text: 'Rooms for sharing'),
              Tab(
                text: 'Rooms for rent',
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
                                              Icons.bookmark_added_outlined),
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
      ),
    );
  }
}
