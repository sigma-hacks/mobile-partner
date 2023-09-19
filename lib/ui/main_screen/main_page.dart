import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../common/theme/app_colors.dart';
import '../../cubits/ui_cubit/app_state.dart';
import '../../cubits/ui_cubit/ui_cubit.dart';
import '../common/out_button.dart';
import 'widgets/function_off.dart';
import 'widgets/nfc_instruction.dart';
import 'widgets/registry_update.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: BlocBuilder<UiCubit, AppState>(
          builder: (context, state) {
            bool nfc = true;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    if (!state.isConnection)
                      const FunctionOff(
                        text: 'Отсутствует подключение к интернету',
                      ),
                    const SizedBox(height: 8),
                    if (!nfc)
                      const FunctionOff(
                        text: 'Выключена функция NFC',
                      ),
                    const SizedBox(height: 8),
                    RegistryUpdate(isConnect: state.isConnection),
                  ],
                ),
                const SizedBox(height: 8),
                OutButton(
                    contentColor: AppColors.blue,
                    fillColor: AppColors.white,
                    text: 'Все акции и скидки',
                    onTap: () {
                      context.pushNamed(RouteName.sales);
                    }),
                NFCInstruction(isOn: nfc),
                const SizedBox(height: 28),
              ],
            );
          },
        ),
      ),
    );
  }
}
