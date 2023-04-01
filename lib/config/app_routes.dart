import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_apps/models/news.dart';
import 'package:navigator_apps/modul/home/home_screen.dart';
import 'package:navigator_apps/modul/news_detail/new_detail_screen.dart';

import '../models/user.dart';
import '../modul/splashscreen/splash_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String newDetail = 'news-detail';
  static const String profile = 'profile';

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  static Page _homeScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User(
        id: 001,
        name: "Lisda Nurhaqiqi",
        userName: "nurhaqiqi",
        email: "2006200@itg.ac.id",
        profileImage:
            "https://scontent.fbdo7-1.fna.fbcdn.net/v/t39.30808-6/296734437_1213132882562234_5004764338487983175_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=0uFb72Ex-OAAX-oPVSL&_nc_ht=scontent.fbdo7-1.fna&oh=00_AfB_VP5uY33X7Qp6oq3-9mHF0iwhmRI4qzVAxz0Yt2Aiog&oe=642C768D",
        phoneNumber: "081220713475",
      );
    }
    return CustomTransitionPage(
      child: HomeScreen(key: state.pageKey, user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Page _newDetailRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.params['id'] != null) {
      return MaterialPage(
          child: NewsDetailScreen(
        news: state.extra as News,
      ));
    } else {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("Data Not Found"),
        ),
      ));
    }
  }

  static final GoRouter goRouter = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRouteBuilder,
      ),
      GoRoute(
        name: newDetail,
        path: "/news-detail/:id",
        pageBuilder: _newDetailRouteBuilder,
      ),
    ],
    initialLocation: "/splash",
  );
}
