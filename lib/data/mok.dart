import '../models/card_type.dart';
import '../models/client.dart';
import '../models/tariff.dart';

final Client client = Client(
  name: 'Виталий Владимирович',
  bday: DateTime(2004, 1, 31),
  tariff: const Tariff(name: 'Обучающийся', sale: 49),
  cardNumber: '2202-10**-****-3325',
  cardType: CardType.bank,
);
