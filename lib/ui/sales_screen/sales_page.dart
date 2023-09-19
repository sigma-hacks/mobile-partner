import 'package:ekzh_partner/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/theme/app_colors.dart';
import '../../cubits/sales_cubit.dart/sales_cubit.dart';
import '../../cubits/sales_cubit.dart/sales_state.dart';
import 'widgets/category_widget.dart';
import 'widgets/sale_widget.dart';

class SalesPage extends StatelessWidget {
  SalesPage({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Все акции и скидки'),
      ),
      body: BlocBuilder<SalesCubit, SalesState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.greyDark),
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 28,
                      ),
                      hintText: 'Искать акцию'),
                  onChanged: BlocProvider.of<SalesCubit>(context).search,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 60,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == 0 || index == Category.values.length
                          ? const SizedBox(width: 12)
                          : CategoryWidget(
                              category: Category.values[index - 1],
                              isSelect: state.currentFilter ==
                                  Category.values[index - 1],
                              // onTap: () {},
                            );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: Category.values.length + 1),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: state.filterSales.isEmpty
                      ? const Center(child: Text('Акций не найдено'))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return SaleWidget(sale: state.filterSales[index]);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: state.filterSales.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
