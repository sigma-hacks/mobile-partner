import 'card_type.dart';
import 'tariff.dart';

class Client {
  final String name;
  final DateTime bday;
  final Tariff tariff;
  final String cardNumber;
  final CardType cardType;

  Client({
    required this.name,
    required this.tariff,
    required this.cardNumber,
    required this.cardType,
    required this.bday,
  });
}
