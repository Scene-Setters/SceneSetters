import 'package:sajhasync/features/home/presentation/view/finder/bookmarked.dart';
import 'package:sajhasync/features/home/presentation/view/finder/bottom_nav.dart';
import 'package:sajhasync/features/home/presentation/view/finder/search.dart';
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
  // static const String editprofileRoute = '/edit';
  static const String profileRoute = '/profile';
  // static const String updatePassword = '/update';
  // static const String resetPassword = '/reset';
  static const String search = '/search';
  static const String bookmark = '/bookmark';
  static const String askPost = '/askPost';
  // static const String updateReview = '/updateReview';

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
      // resetPassword: (context) => const ResetPassword(),
      // allReviews: (context) => const AllReviewsView(),
      // writeReview: (context) => const WriteReview(),
      // updateReview: (context) => const UpdateReview(),
    };
  }
}
