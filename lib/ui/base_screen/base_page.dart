import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/theme/app_colors.dart';
import '../../cubits/app_cubit/app_state.dart';
import '../../cubits/app_cubit/app_cubit.dart';
import '../../models/app_tabs.dart';
import '../main_screen/main_page.dart';
import '../profile_screen/profile_page.dart';
import 'widgets/qr_button.dart';

class BottomItem {
  final IconData icon;
  final String label;
  const BottomItem({
    required this.icon,
    required this.label,
  });
}

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  final _bottomItems = const [
    BottomItem(icon: Icons.home, label: 'Главная'),
    BottomItem(icon: Icons.store, label: 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        int currentIndex = AppTabs.values.indexOf(state.currentTab);
        return Scaffold(
          body: SafeArea(
              child: state.currentTab == AppTabs.main
                  ? const MainPage()
                  : const ProfilePage()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const QRButton(),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AppCubit>(context)
                            .updateTab(AppTabs.main);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _bottomItems[0].icon,
                            color: currentIndex == 0
                                ? AppColors.blue
                                : AppColors.greyDark,
                          ),
                          Text(
                            _bottomItems[0].label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: currentIndex == 0
                                        ? AppColors.blue
                                        : AppColors.greyDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AppCubit>(context)
                            .updateTab(AppTabs.profile);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _bottomItems[1].icon,
                            color: currentIndex == 1
                                ? AppColors.blue
                                : AppColors.greyDark,
                          ),
                          Text(
                            _bottomItems[1].label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: currentIndex == 1
                                        ? AppColors.blue
                                        : AppColors.greyDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
