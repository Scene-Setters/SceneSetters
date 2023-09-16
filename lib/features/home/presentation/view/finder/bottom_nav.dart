import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/features/home/presentation/view/finder/bookmarked.dart';
import 'package:sajhasync/features/home/presentation/view/finder/profile.dart';
import 'package:sajhasync/features/home/presentation/view/finder/search.dart';
import 'package:sajhasync/features/home/presentation/view/finder/user_dashboard.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/rent_view_model.dart';
import 'package:sajhasync/features/home/presentation/viewmodel/share_view_model.dart';

import '../../../../../config/constants/app_color_theme.dart';

class BottomNavView extends ConsumerStatefulWidget {
  const BottomNavView({super.key});

  @override
  ConsumerState<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends ConsumerState<BottomNavView> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rentViewModelProvider.notifier).getRentedFlats();
      ref.read(shareViewModelProvider.notifier).getSharedFlats();
    });
    super.initState();
  }

  int index = 0;
  final screens = [
    const DashboardView(),
    const SearchScreen(),
    const BookMarked(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home_filled, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.bookmark, size: 30),
      const Icon(Icons.person_2, size: 30)
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: AppColors.navbarbackColors,
          ),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: AppColors.navbarbodyColors,
          buttonBackgroundColor: AppColors.navbarbodyColors,
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
