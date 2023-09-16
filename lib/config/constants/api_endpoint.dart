class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3001/";
  // static const String baseUrl = "http://192.168.137.1:3001/";

  // ====================== Auth Routes ======================
  static const String login = "users/login";
  static const String register = "users/register";
  static const String verifyUser = "users/";
  static const String changePassword = "users/change-password";
  static const String uploadImage = "users/uploadImage";
  static const String updateProfile = "users/edit-profile";

  //======================== Rent Routes =====================
  static const String getRentedRooms = "flats/rent";
  // static const String getPopularMovies = "movies/popular";
  // static const String getTopRatedMovies = "movies/top_rated";
  // static const String getMovieDetails = "movies/";

  //======================== Share Routes =====================

  static const String getSharedRooms = "flats/share";
  static const String getAllPostsById = 'flats';
  // static const String likeReview = "/like";
  // static const String dislikeReview = "/unlike";
  // static const String addReview = "/reviews";
  // static const String updateReview = "/reviews";
  // static const String deleteReview = "/reviews";

  //======================== Search Routes =====================
  // static const String searchRooms = "/search";
  static const String getSearchByAddress = "flats/search";

  // //======================== Watchlist Routes =====================
  // static const String createWatchlist = "watchlist/";
  // static const String deleteWatchlist = "watchlist/";
  // static const String getWatchlist = "watchlist/";
}
