import 'package:sajhasync/features/home/presentation/view/finder/user_dashboard.dart';

import '../../features/auth/presentation/view/login.dart';
import '../../features/auth/presentation/view/register.dart';

class AppRoute {
  AppRoute._();

  // static const String splashRoute = '/';
  // static const String watchlistRoute = '/watchlists';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String dashboardRoute = '/dashboard';
  // static const String movieRoute = '/movies';
  // static const String editprofileRoute = '/edit';
  // static const String profileRoute = '/profile';
  // static const String updatePassword = '/update';
  // static const String resetPassword = '/reset';
  // static const String allReviews = '/allReviews';
  // static const String movieScreen = '/movieScreen';
  // static const String writeReview = '/writeReview';
  // static const String updateReview = '/updateReview';

  static getApplicationRoute() {
    return {
      // splashRoute: (context) => const SplashScreenView(),
      // watchlistRoute: (context) => const WatchListScreen(),
      loginRoute: (context) => const LoginViews(),
      registerRoute: (context) => const RegisterViews(),
      dashboardRoute: (context) => const DashboardView(),
      // movieRoute: (context) => const AboutMovies(),
      // movieScreen: (context) => const MovieScreen(),
      // editprofileRoute: (context) => const EditProfile(),
      // profileRoute: (context) => const ProfileScreen(),
      // updatePassword: (context) => const UpdatePasswordView(),
      // resetPassword: (context) => const ResetPassword(),
      // allReviews: (context) => const AllReviewsView(),
      // writeReview: (context) => const WriteReview(),
      // updateReview: (context) => const UpdateReview(),
    };
  }
}
