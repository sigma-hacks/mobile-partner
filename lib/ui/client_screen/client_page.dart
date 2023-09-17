import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../common/theme/app_colors.dart';
import '../../models/client.dart';
import '../common/out_button.dart';
import '../common/client_card.dart';

class ClientPage extends StatelessWidget {
  final Client? client;
  const ClientPage({
    super.key,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    context.goNamed(RouteName.base);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.blue,
                  )),
            ),
            client == null
                ? const Center(child: CircularProgressIndicator())
                : Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, top: 32, bottom: 12),
                      child: Column(
                        children: [
                          Text(
                            'Держатель ЕКЖ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Divider(color: AppColors.blueLight),
                          const SizedBox(height: 12),
                          ClientCard(
                            passenger: client!,
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.goNamed(RouteName.base);
                              },
                              child: Text('Скидка предоставлена'),
                            ),
                          ),
                          const SizedBox(height: 12),
                          OutButton(
                              borderColor: AppColors.error,
                              contentColor: AppColors.error,
                              fillColor: AppColors.white,
                              text: 'Сообщить о неточности',
                              onTap: () {}),
                        ],
                      ),
                    );
                  }),
          ],
        ),
      ),
    );
  }
}
