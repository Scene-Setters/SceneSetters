import 'package:sajhasync/features/details/presentation/view/individual.dart';
import 'package:sajhasync/features/details/presentation/view/share_individual.dart';
import 'package:sajhasync/features/home/presentation/view/finder/add_room.dart';
import 'package:sajhasync/features/home/presentation/view/finder/bookmarked.dart';
import 'package:sajhasync/features/home/presentation/view/finder/bottom_nav.dart';
import 'package:sajhasync/features/home/presentation/view/finder/search.dart';
import 'package:sajhasync/features/home/presentation/view/finder/share_room.dart';
import 'package:sajhasync/features/home/presentation/view/finder/user_dashboard.dart';
import 'package:sajhasync/features/home/presentation/view/poster/ask_post.dart';

import '../../features/auth/presentation/view/login.dart';
import '../../features/auth/presentation/view/register.dart';
import '../../features/home/presentation/view/finder/profile.dart';

class AppRoute {
  AppRoute._();

  // static const String splashRoute = '/';
  // static const String watchlistRoute = '/watchlists';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String dashboardRoute = '/dashboard';
  static const String dashRoute = '/dash';
  static const String individual = '/individual';
  static const String profileRoute = '/profile';
  static const String shareRoom = '/shareRoom';
  static const String shareIndividual = '/shareIndividual';
  static const String search = '/search';
  static const String bookmark = '/bookmark';
  static const String askPost = '/askPost';
  static const String addRoom = '/addRoom';

  static getApplicationRoute() {
    return {
      // splashRoute: (context) => const SplashScreenView(),
      // watchlistRoute: (context) => const WatchListScreen(),
      loginRoute: (context) => const LoginViews(),
      registerRoute: (context) => const RegisterViews(),
      dashboardRoute: (context) => const DashboardView(),
      dashRoute: (context) => const BottomNavView(),
      search: (context) => const SearchScreen(),
      bookmark: (context) => const BookMarked(),
      profileRoute: (context) => const ProfileScreen(),
      askPost: (context) => const AskPoster(),
      individual: (context) => const IndividualView(),
      shareRoom: (context) => const ShareRoom(),
      shareIndividual: (context) => const ShareIndividualView(),
      // writeReview: (context) => const WriteReview(),
      addRoom: (context) => const AddRoom(),
    };
  }
}
