import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/mok.dart';
import '../../ui/base_screen/base_page.dart';
import '../../ui/login_screen/login_page.dart';
import '../../ui/client_screen/client_page.dart';
import '../../ui/qr_screen/qr_page.dart';
import '../../ui/sales_screen/sales_page.dart';
import 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.login,
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.login,
      path: RouteName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: RouteName.base,
      path: RouteName.base,
      builder: (BuildContext context, GoRouterState state) {
        return const BasePage();
      },
    ),
    GoRoute(
      name: RouteName.qr,
      path: '${RouteName.base}/${RouteName.qr}',
      builder: (BuildContext context, GoRouterState state) {
        return const QrPage();
      },
    ),
    GoRoute(
      name: RouteName.client,
      path: RouteName.client,
      builder: (BuildContext context, GoRouterState state) {
        return ClientPage(client: client);
      },
    ),
    GoRoute(
      name: RouteName.sales,
      path: '${RouteName.base}${RouteName.sales}',
      builder: (BuildContext context, GoRouterState state) {
        return const SalesPage();
      },
    ),
  ],
);
