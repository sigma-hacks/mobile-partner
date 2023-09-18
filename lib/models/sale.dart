import 'category.dart';

class Sale {
  final String name;
  final int sale;
  final List<Category> categories;
  final DateTime finishDate;
  const Sale({
    required this.name,
    required this.sale,
    required this.categories,
    required this.finishDate,
  });
}
