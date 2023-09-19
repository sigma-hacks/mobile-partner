import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/mok.dart';
import '../../models/category.dart';
import '../../models/sale.dart';
import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  SalesCubit() : super(SalesState.initial());

  void updateFilter(Category newFilter) {
    List<Sale> filteredSales = [];
    if (newFilter == Category.none) {
      filteredSales = sales;
    } else {
      filteredSales = sales
          .where((sale) =>
              sale.categories.contains(newFilter) ||
              sale.categories.contains(Category.all))
          .toList();
    }
    emit(state.copyWith(filterSales: filteredSales, currentFilter: newFilter));
  }

  void search(String value) {
    final filteredSales = sales.where((sale) {
      final title = sale.name.toLowerCase();
      final search = value.toLowerCase();
      return title.contains(search);
    }).toList();
    emit(state.copyWith(
        filterSales: filteredSales, currentFilter: state.currentFilter));
  }
}
