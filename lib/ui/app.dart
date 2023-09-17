import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/navigation/router.dart';
import '../common/theme/light_theme.dart';
import '../cubits/ui_cubit.dart';
import '../services/reachability_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UiCubit>(
          create: (_) => UiCubit(ReachabilityService())..listenToConnectivity(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ЕКЖ',
        theme: themeLight,
        routerConfig: router,
      ),
    );
  }
}
