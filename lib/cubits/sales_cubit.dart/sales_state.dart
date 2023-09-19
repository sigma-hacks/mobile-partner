import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/mok.dart';
import '../../models/category.dart';
import '../../models/sale.dart';

part 'sales_state.freezed.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState({
    @Default(Category.none) Category currentFilter,
    @Default([]) List<Sale> filterSales,
  }) = _SalesState;

  const SalesState._();

  factory SalesState.initial() =>
      SalesState(filterSales: sales, currentFilter: Category.none);
}
