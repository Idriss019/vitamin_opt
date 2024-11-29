import 'package:drift/drift.dart';
import 'package:vitamin_opt/data/db/database.dart';

final database = AppDatabase();

class ArchiveTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  RealColumn get priceOfSom => real().nullable()();
}

class ArchiveBase {
  /// добавить новую строку
  static Future<void> insertArchive(
      {required String product, String? barcode}) async {
    await database.into(database.archiveTable).insert(ArchiveTableCompanion(
        product: Value(product), barcode: Value(barcode)));
  }
  static Future<List<dynamic>> selectArchiveAll() async {
    List result = await database.select(database.archiveTable).get();
    return result;
  }
  /// показать все 2
  static Future<List<ArchiveTableData>> getAll() async {
    return await database.managers.archiveTable.get();
  }
  /// удалить по айди
  static Future<void> deleteById(int id) async {
    await (database.delete(database.archiveTable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
  /// очистить таблицу
  static Future<void> deleteAll() async {
    await database.managers.archiveTable.delete();
  }
  /// изменить по айди штрих-код
  static Future<void> updateByIdBar(
      {required int id, required String barcode}) async {
    await (database.update(database.archiveTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(ArchiveTableCompanion(barcode: Value(barcode)));
  }
  /// изменить по айди
  static Future<void> updateByIdPr(
      {required int id, required String product}) async {
    await (database.update(database.archiveTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(ArchiveTableCompanion(product: Value(product)));
  }
}

