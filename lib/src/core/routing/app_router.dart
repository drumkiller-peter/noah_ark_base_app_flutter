import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noah_ark_base_app_flutter/src/core/routing/main_shell.dart';
import 'package:noah_ark_base_app_flutter/src/features/admin/presentation/screens/admin_dashboard_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/auth/presentation/screens/login_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/auth/presentation/screens/register_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/presentation/screens/bulletins_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/devotional/presentation/screens/devotional_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/presentation/screens/events_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/giving/presentation/screens/giving_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/presentation/screens/groups_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/hymns/presentation/screens/hymns_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/prayer/presentation/screens/prayer_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/sermons/presentation/screens/sermons_screen.dart';
import 'package:noah_ark_base_app_flutter/src/features/watch/presentation/screens/watch_glance_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// Declarative GoRouter configuration conforming to ADR 0008 and ADR 0005.
GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/devotional',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/devotional',
                builder: (context, state) => const DevotionalScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/hymns',
                builder: (context, state) => const HymnsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/events',
                builder: (context, state) => const EventsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/prayer',
                builder: (context, state) => const PrayerScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/giving',
                builder: (context, state) => const GivingScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/bulletins',
        builder: (context, state) => const BulletinsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sermons',
        builder: (context, state) => const SermonsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/groups',
        builder: (context, state) => const GroupsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/admin',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/workspace',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/watch/glance',
        builder: (context, state) => const WatchGlanceScreen(),
      ),
    ],
  );
}
