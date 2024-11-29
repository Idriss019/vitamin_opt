import 'package:drift/drift.dart';

class SalesTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().nullable()();
  RealColumn get sumBasket => real().nullable()(); // Сумма корзины в рублях
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество
  RealColumn get priceOfSom => real().nullable()();
  RealColumn get course => real().nullable()(); // Курс
}
