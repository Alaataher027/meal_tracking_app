import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/add_meal_view.dart';
import 'package:meal_tracking_app/features/home/presentation/views/home_view.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/detailes_view.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/search_view.dart';
import 'package:meal_tracking_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KAddMealView = '/addMealView';
  static const KSearchView = '/searchView';
  static const KSearchDetailsView = '/detailesView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KAddMealView,
        builder: (context, state) => const AddMealView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: KSearchDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
}
