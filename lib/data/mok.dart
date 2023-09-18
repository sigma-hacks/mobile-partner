import 'package:ekzh_partner/models/category.dart';

import '../models/card_type.dart';
import '../models/client.dart';
import '../models/sale.dart';
import '../models/tariff.dart';

final Client client = Client(
  name: 'Виталий Владимирович',
  bday: DateTime(2004, 1, 31),
  tariff: const Tariff(name: 'Обучающийся', sale: 49),
  cardNumber: '2202-10**-****-3325',
  cardType: CardType.bank,
);

final List<Sale> sales = [
  Sale(
    name: 'Вкусный понедельник',
    categories: [Category.all],
    sale: 30,
    finishDate: DateTime(2023, 9, 18),
  ),
  Sale(
    name: 'Бабье лето',
    categories: [Category.all],
    sale: 20,
    finishDate: DateTime(2023, 9, 25),
  ),
  Sale(
    name: 'Всё вкусное - детям',
    categories: [Category.child],
    sale: 18,
    finishDate: DateTime(2023, 12, 31),
  ),
  Sale(
    name: 'Социальная',
    categories: [Category.social, Category.child, Category.pensioner],
    sale: 25,
    finishDate: DateTime(2024, 12, 31),
  ),
  Sale(
    name: 'Северное сияние',
    categories: [Category.woman],
    sale: 10,
    finishDate: DateTime(2023, 11, 30),
  ),
  // Sale(
  //   name: 'Бабье лето',
  //   categories: [Category.all],
  //   sale: 20,
  //   finishDate: DateTime(2023, 9, 25),
  // ),
  // Sale(
  //   name: 'Бабье лето',
  //   categories: [Category.all],
  //   sale: 20,
  //   finishDate: DateTime(2023, 9, 25),
  // ),
];
