import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final bool isSelect;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyLight,
        border: Border.all(
          color: isSelect ? AppColors.greenDark : Colors.transparent,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          categotyName(category),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isSelect ? AppColors.greenDark : AppColors.greyDark,
              ),
        ),
      ),
    );
  }
}
