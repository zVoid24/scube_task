import 'package:go_router/go_router.dart';
import 'package:scube/features/auth/presentation/screens/login_screen.dart';
import 'package:scube/features/dashboard/presentation/screens/dashboard_screen.dart';

import 'package:scube/features/dashboard/presentation/screens/second_page_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/second_page',
      builder: (context, state) => const SecondPageScreen(),
    ),
  ],
);
