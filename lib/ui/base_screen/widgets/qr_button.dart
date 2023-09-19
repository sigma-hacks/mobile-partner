import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/theme/app_colors.dart';

class QRButton extends StatefulWidget {
  const QRButton({
    super.key,
  });

  @override
  State<QRButton> createState() => _QRButtonState();
}

class _QRButtonState extends State<QRButton> {
  @override
  void initState() {
    super.initState();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      log(tag.data.toString());
      context.goNamed(RouteName.client);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 32,
      onTap: () {
        context.pushNamed(RouteName.qr);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.blueLight, AppColors.greenLight],
          ),
        ),
        child: SvgPicture.asset(
          'assets/images/qr.svg',
          height: 64,
        ),
      ),
    );
  }
}
