import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/category.dart';
import '../../../models/sale.dart';

class SaleWidget extends StatelessWidget {
  final Sale sale;
  const SaleWidget({
    super.key,
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greyLighter),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    sale.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  'до ${DateFormat('dd.MM.yyyy').format(sale.finishDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        sale.categories.length,
                        (index) => ForWho(category: sale.categories[index]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${sale.sale}%',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
          ],
        ));
  }
}

class ForWho extends StatelessWidget {
  const ForWho({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.greenLight),
      child: Text(
        categotyName(category).toLowerCase(),
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.white),
      ),
    );
  }
}
