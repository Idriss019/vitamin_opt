import 'package:drift/drift.dart';

class StorageTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество
  RealColumn get priceOfSom => real().nullable()();
}