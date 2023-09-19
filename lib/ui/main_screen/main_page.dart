import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../common/navigation/route_name.dart';
import '../../common/theme/app_colors.dart';
import '../../cubits/app_cubit/app_state.dart';
import '../../cubits/app_cubit/app_cubit.dart';
import '../common/out_button.dart';
import 'widgets/function_off.dart';
import 'widgets/nfc_instruction.dart';
import 'widgets/registry_update.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Timer? timer;
  bool isNfc = true;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) async {
      isNfc = await NfcManager.instance.isAvailable();
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
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
                    if (!isNfc)
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
                NFCInstruction(isOn: isNfc),
                const SizedBox(height: 28),
              ],
            );
          },
        ),
      ),
    );
  }
}
