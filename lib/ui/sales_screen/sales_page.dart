import 'package:ekzh_partner/models/category.dart';
import 'package:flutter/material.dart';

import '../../data/mok.dart';
import 'widgets/category_widget.dart';
import 'widgets/sale_widget.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Все акции и скидки'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  hintText: 'Искать акцию'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 60,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const SizedBox(width: 16)
                      : CategoryWidget(
                          category: Category.values[index - 1],
                          isSelect: index == 1,
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: sales.length + 1),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SaleWidget(sale: sales[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: sales.length),
            ),
          ),
        ],
      ),
    );
  }
}
