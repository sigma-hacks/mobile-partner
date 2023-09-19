import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../common/navigation/route_name.dart';
import '../../common/theme/app_colors.dart';
import 'widgets/menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.blueLighter,
              radius: 50,
              child: Icon(
                Icons.store_mall_directory_outlined,
                color: AppColors.white,
                size: 72,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Блинный домик "Аромат Севера"',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            MenuItem(
              text: 'Акции и скидки',
              onTap: () {
                context.pushNamed(RouteName.sales);
              },
            ),
            MenuItem(
                text: 'Статистика',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Функция в разработке')));
                }),
            MenuItem(
                text: 'Обращения и жалобы',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Функция в разработке')));
                }),
            MenuItem(
                text: 'О приложении',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Функция в разработке')));
                }),
            TextButton(
              onPressed: () {
                NfcManager.instance.stopSession();
                context.goNamed(RouteName.login);
              },
              child: const Text('Выйти'),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
