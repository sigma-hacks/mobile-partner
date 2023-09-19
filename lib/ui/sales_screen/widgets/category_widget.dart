import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';
import '../../../cubits/sales_cubit.dart/sales_cubit.dart';
import '../../../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final bool isSelect;
  // final Function() onTap;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelect,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (BlocProvider.of<SalesCubit>(context).state.currentFilter ==
            category) {
          BlocProvider.of<SalesCubit>(context).updateFilter(Category.none);
        } else {
          BlocProvider.of<SalesCubit>(context).updateFilter(category);
        }
      },
      child: Ink(
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
                  fontSize: 18,
                  color: isSelect ? AppColors.greenDark : AppColors.greyDark,
                ),
          ),
        ),
      ),
    );
  }
}
