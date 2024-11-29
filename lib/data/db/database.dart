import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:vitamin_opt/data/db/tables/archiveTable.dart';
import 'package:vitamin_opt/data/db/tables/salesTable.dart';
import 'package:vitamin_opt/data/db/tables/storageTable.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ArchiveTable, StorageTable, SalesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'optVitamin01');
  }
}
