import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/features/home/presentation/views/home_view.dart';
import 'package:meal_tracking_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
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
    ],
  );
}
