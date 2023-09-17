import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/theme/app_colors.dart';
import '../../models/client.dart';
import 'wrapper.dart';

class ClientCard extends StatelessWidget {
  final Client passenger;
  const ClientCard({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
        verticalPadding: 20,
        margin: 0,
        color: AppColors.blueLighter,
        child: Column(
          children: [
            Text(
              passenger.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              passenger.cardNumber,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                Text(
                  passenger.tariff.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Тариф',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateTime.now().difference(passenger.bday).inDays ~/ 365} лет',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      DateFormat('dd.MM.yyyy').format(passenger.bday),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${passenger.tariff.sale}%',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Лучшая скидка',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}




// DraggableScrollableSheet(
//           initialChildSize: 0.3,
//           maxChildSize: 0.75,
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Stack(
//               children: [
//                 Text('Маршрут'),
//                 const SizedBox(height: 8),
//                 Text(
//                   '250А',
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium!
//                       .copyWith(color: AppColors.blue),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(20)),
//                       color: AppColors.white.withOpacity(0.95),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.greyDark,
//                           blurRadius: 5,
//                         )
//                       ]),
//                   padding: EdgeInsets.only(top: 50, left: 20, right: 20),
//                   child: ListView.builder(
//                     controller: scrollController,
//                     itemCount: 50,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading: CircleAvatar(
//                           radius: 20,
//                           backgroundColor: AppColors.blueLighter,
//                         ),
//                         title: Text('ФИО'),
//                         subtitle: Text('20.03.2023 в 14:52'),
//                         trailing: Text(
//                           '32 ₽',
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 8),
//                       Text(
//                         'История оплат',
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       const Divider(
//                         color: AppColors.blueLight,
//                         indent: 20,
//                         endIndent: 20,
//                       ),
//                     ],
//                   ),