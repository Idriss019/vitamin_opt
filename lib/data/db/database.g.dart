// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ArchiveTableTable extends ArchiveTable
    with TableInfo<$ArchiveTableTable, ArchiveTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArchiveTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
      'product', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceOfSomMeta =
      const VerificationMeta('priceOfSom');
  @override
  late final GeneratedColumn<double> priceOfSom = GeneratedColumn<double>(
      'price_of_som', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, barcode, product, priceOfSom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'archive_table';
  @override
  VerificationContext validateIntegrity(Insertable<ArchiveTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('price_of_som')) {
      context.handle(
          _priceOfSomMeta,
          priceOfSom.isAcceptableOrUnknown(
              data['price_of_som']!, _priceOfSomMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArchiveTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArchiveTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      priceOfSom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_of_som']),
    );
  }

  @override
  $ArchiveTableTable createAlias(String alias) {
    return $ArchiveTableTable(attachedDatabase, alias);
  }
}

class ArchiveTableData extends DataClass
    implements Insertable<ArchiveTableData> {
  final int id;
  final String? barcode;
  final String product;
  final double? priceOfSom;
  const ArchiveTableData(
      {required this.id, this.barcode, required this.product, this.priceOfSom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    if (!nullToAbsent || priceOfSom != null) {
      map['price_of_som'] = Variable<double>(priceOfSom);
    }
    return map;
  }

  ArchiveTableCompanion toCompanion(bool nullToAbsent) {
    return ArchiveTableCompanion(
      id: Value(id),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      priceOfSom: priceOfSom == null && nullToAbsent
          ? const Value.absent()
          : Value(priceOfSom),
    );
  }

  factory ArchiveTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArchiveTableData(
      id: serializer.fromJson<int>(json['id']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      priceOfSom: serializer.fromJson<double?>(json['priceOfSom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'priceOfSom': serializer.toJson<double?>(priceOfSom),
    };
  }

  ArchiveTableData copyWith(
          {int? id,
          Value<String?> barcode = const Value.absent(),
          String? product,
          Value<double?> priceOfSom = const Value.absent()}) =>
      ArchiveTableData(
        id: id ?? this.id,
        barcode: barcode.present ? barcode.value : this.barcode,
        product: product ?? this.product,
        priceOfSom: priceOfSom.present ? priceOfSom.value : this.priceOfSom,
      );
  ArchiveTableData copyWithCompanion(ArchiveTableCompanion data) {
    return ArchiveTableData(
      id: data.id.present ? data.id.value : this.id,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      priceOfSom:
          data.priceOfSom.present ? data.priceOfSom.value : this.priceOfSom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArchiveTableData(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('priceOfSom: $priceOfSom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, barcode, product, priceOfSom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArchiveTableData &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.priceOfSom == this.priceOfSom);
}

class ArchiveTableCompanion extends UpdateCompanion<ArchiveTableData> {
  final Value<int> id;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<double?> priceOfSom;
  const ArchiveTableCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.priceOfSom = const Value.absent(),
  });
  ArchiveTableCompanion.insert({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    required String product,
    this.priceOfSom = const Value.absent(),
  }) : product = Value(product);
  static Insertable<ArchiveTableData> custom({
    Expression<int>? id,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<double>? priceOfSom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (priceOfSom != null) 'price_of_som': priceOfSom,
    });
  }

  ArchiveTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? barcode,
      Value<String>? product,
      Value<double?>? priceOfSom}) {
    return ArchiveTableCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      priceOfSom: priceOfSom ?? this.priceOfSom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (priceOfSom.present) {
      map['price_of_som'] = Variable<double>(priceOfSom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArchiveTableCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('priceOfSom: $priceOfSom')
          ..write(')'))
        .toString();
  }
}

class $StorageTableTable extends StorageTable
    with TableInfo<$StorageTableTable, StorageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
      'product', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceOfSomMeta =
      const VerificationMeta('priceOfSom');
  @override
  late final GeneratedColumn<double> priceOfSom = GeneratedColumn<double>(
      'price_of_som', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, barcode, product, quantity, priceOfSom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_table';
  @override
  VerificationContext validateIntegrity(Insertable<StorageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price_of_som')) {
      context.handle(
          _priceOfSomMeta,
          priceOfSom.isAcceptableOrUnknown(
              data['price_of_som']!, _priceOfSomMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      priceOfSom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_of_som']),
    );
  }

  @override
  $StorageTableTable createAlias(String alias) {
    return $StorageTableTable(attachedDatabase, alias);
  }
}

class StorageTableData extends DataClass
    implements Insertable<StorageTableData> {
  final int id;
  final String? barcode;
  final String product;
  final int quantity;
  final double? priceOfSom;
  const StorageTableData(
      {required this.id,
      this.barcode,
      required this.product,
      required this.quantity,
      this.priceOfSom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || priceOfSom != null) {
      map['price_of_som'] = Variable<double>(priceOfSom);
    }
    return map;
  }

  StorageTableCompanion toCompanion(bool nullToAbsent) {
    return StorageTableCompanion(
      id: Value(id),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      quantity: Value(quantity),
      priceOfSom: priceOfSom == null && nullToAbsent
          ? const Value.absent()
          : Value(priceOfSom),
    );
  }

  factory StorageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageTableData(
      id: serializer.fromJson<int>(json['id']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      priceOfSom: serializer.fromJson<double?>(json['priceOfSom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'priceOfSom': serializer.toJson<double?>(priceOfSom),
    };
  }

  StorageTableData copyWith(
          {int? id,
          Value<String?> barcode = const Value.absent(),
          String? product,
          int? quantity,
          Value<double?> priceOfSom = const Value.absent()}) =>
      StorageTableData(
        id: id ?? this.id,
        barcode: barcode.present ? barcode.value : this.barcode,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        priceOfSom: priceOfSom.present ? priceOfSom.value : this.priceOfSom,
      );
  StorageTableData copyWithCompanion(StorageTableCompanion data) {
    return StorageTableData(
      id: data.id.present ? data.id.value : this.id,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      priceOfSom:
          data.priceOfSom.present ? data.priceOfSom.value : this.priceOfSom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableData(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('priceOfSom: $priceOfSom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, barcode, product, quantity, priceOfSom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableData &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.priceOfSom == this.priceOfSom);
}

class StorageTableCompanion extends UpdateCompanion<StorageTableData> {
  final Value<int> id;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<int> quantity;
  final Value<double?> priceOfSom;
  const StorageTableCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.priceOfSom = const Value.absent(),
  });
  StorageTableCompanion.insert({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    required String product,
    required int quantity,
    this.priceOfSom = const Value.absent(),
  })  : product = Value(product),
        quantity = Value(quantity);
  static Insertable<StorageTableData> custom({
    Expression<int>? id,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<double>? priceOfSom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (priceOfSom != null) 'price_of_som': priceOfSom,
    });
  }

  StorageTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? barcode,
      Value<String>? product,
      Value<int>? quantity,
      Value<double?>? priceOfSom}) {
    return StorageTableCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      priceOfSom: priceOfSom ?? this.priceOfSom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (priceOfSom.present) {
      map['price_of_som'] = Variable<double>(priceOfSom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('priceOfSom: $priceOfSom')
          ..write(')'))
        .toString();
  }
}

class $SalesTableTable extends SalesTable
    with TableInfo<$SalesTableTable, SalesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sumBasketMeta =
      const VerificationMeta('sumBasket');
  @override
  late final GeneratedColumn<double> sumBasket = GeneratedColumn<double>(
      'sum_basket', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
      'product', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceOfSomMeta =
      const VerificationMeta('priceOfSom');
  @override
  late final GeneratedColumn<double> priceOfSom = GeneratedColumn<double>(
      'price_of_som', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<double> course = GeneratedColumn<double>(
      'course', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, sumBasket, barcode, product, quantity, priceOfSom, course];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_table';
  @override
  VerificationContext validateIntegrity(Insertable<SalesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('sum_basket')) {
      context.handle(_sumBasketMeta,
          sumBasket.isAcceptableOrUnknown(data['sum_basket']!, _sumBasketMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price_of_som')) {
      context.handle(
          _priceOfSomMeta,
          priceOfSom.isAcceptableOrUnknown(
              data['price_of_som']!, _priceOfSomMeta));
    }
    if (data.containsKey('course')) {
      context.handle(_courseMeta,
          course.isAcceptableOrUnknown(data['course']!, _courseMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      sumBasket: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sum_basket']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      priceOfSom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_of_som']),
      course: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}course']),
    );
  }

  @override
  $SalesTableTable createAlias(String alias) {
    return $SalesTableTable(attachedDatabase, alias);
  }
}

class SalesTableData extends DataClass implements Insertable<SalesTableData> {
  final int id;
  final DateTime? date;
  final double? sumBasket;
  final String? barcode;
  final String product;
  final int quantity;
  final double? priceOfSom;
  final double? course;
  const SalesTableData(
      {required this.id,
      this.date,
      this.sumBasket,
      this.barcode,
      required this.product,
      required this.quantity,
      this.priceOfSom,
      this.course});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || sumBasket != null) {
      map['sum_basket'] = Variable<double>(sumBasket);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || priceOfSom != null) {
      map['price_of_som'] = Variable<double>(priceOfSom);
    }
    if (!nullToAbsent || course != null) {
      map['course'] = Variable<double>(course);
    }
    return map;
  }

  SalesTableCompanion toCompanion(bool nullToAbsent) {
    return SalesTableCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      sumBasket: sumBasket == null && nullToAbsent
          ? const Value.absent()
          : Value(sumBasket),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      quantity: Value(quantity),
      priceOfSom: priceOfSom == null && nullToAbsent
          ? const Value.absent()
          : Value(priceOfSom),
      course:
          course == null && nullToAbsent ? const Value.absent() : Value(course),
    );
  }

  factory SalesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesTableData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime?>(json['date']),
      sumBasket: serializer.fromJson<double?>(json['sumBasket']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      priceOfSom: serializer.fromJson<double?>(json['priceOfSom']),
      course: serializer.fromJson<double?>(json['course']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime?>(date),
      'sumBasket': serializer.toJson<double?>(sumBasket),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'priceOfSom': serializer.toJson<double?>(priceOfSom),
      'course': serializer.toJson<double?>(course),
    };
  }

  SalesTableData copyWith(
          {int? id,
          Value<DateTime?> date = const Value.absent(),
          Value<double?> sumBasket = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          String? product,
          int? quantity,
          Value<double?> priceOfSom = const Value.absent(),
          Value<double?> course = const Value.absent()}) =>
      SalesTableData(
        id: id ?? this.id,
        date: date.present ? date.value : this.date,
        sumBasket: sumBasket.present ? sumBasket.value : this.sumBasket,
        barcode: barcode.present ? barcode.value : this.barcode,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        priceOfSom: priceOfSom.present ? priceOfSom.value : this.priceOfSom,
        course: course.present ? course.value : this.course,
      );
  SalesTableData copyWithCompanion(SalesTableCompanion data) {
    return SalesTableData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      sumBasket: data.sumBasket.present ? data.sumBasket.value : this.sumBasket,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      priceOfSom:
          data.priceOfSom.present ? data.priceOfSom.value : this.priceOfSom,
      course: data.course.present ? data.course.value : this.course,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('sumBasket: $sumBasket, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('priceOfSom: $priceOfSom, ')
          ..write('course: $course')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, sumBasket, barcode, product, quantity, priceOfSom, course);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.sumBasket == this.sumBasket &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.priceOfSom == this.priceOfSom &&
          other.course == this.course);
}

class SalesTableCompanion extends UpdateCompanion<SalesTableData> {
  final Value<int> id;
  final Value<DateTime?> date;
  final Value<double?> sumBasket;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<int> quantity;
  final Value<double?> priceOfSom;
  final Value<double?> course;
  const SalesTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.sumBasket = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.priceOfSom = const Value.absent(),
    this.course = const Value.absent(),
  });
  SalesTableCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.sumBasket = const Value.absent(),
    this.barcode = const Value.absent(),
    required String product,
    required int quantity,
    this.priceOfSom = const Value.absent(),
    this.course = const Value.absent(),
  })  : product = Value(product),
        quantity = Value(quantity);
  static Insertable<SalesTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? sumBasket,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<double>? priceOfSom,
    Expression<double>? course,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (sumBasket != null) 'sum_basket': sumBasket,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (priceOfSom != null) 'price_of_som': priceOfSom,
      if (course != null) 'course': course,
    });
  }

  SalesTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? date,
      Value<double?>? sumBasket,
      Value<String?>? barcode,
      Value<String>? product,
      Value<int>? quantity,
      Value<double?>? priceOfSom,
      Value<double?>? course}) {
    return SalesTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      sumBasket: sumBasket ?? this.sumBasket,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      priceOfSom: priceOfSom ?? this.priceOfSom,
      course: course ?? this.course,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (sumBasket.present) {
      map['sum_basket'] = Variable<double>(sumBasket.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (priceOfSom.present) {
      map['price_of_som'] = Variable<double>(priceOfSom.value);
    }
    if (course.present) {
      map['course'] = Variable<double>(course.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('sumBasket: $sumBasket, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('priceOfSom: $priceOfSom, ')
          ..write('course: $course')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArchiveTableTable archiveTable = $ArchiveTableTable(this);
  late final $StorageTableTable storageTable = $StorageTableTable(this);
  late final $SalesTableTable salesTable = $SalesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [archiveTable, storageTable, salesTable];
}

typedef $$ArchiveTableTableCreateCompanionBuilder = ArchiveTableCompanion
    Function({
  Value<int> id,
  Value<String?> barcode,
  required String product,
  Value<double?> priceOfSom,
});
typedef $$ArchiveTableTableUpdateCompanionBuilder = ArchiveTableCompanion
    Function({
  Value<int> id,
  Value<String?> barcode,
  Value<String> product,
  Value<double?> priceOfSom,
});

class $$ArchiveTableTableFilterComposer
    extends Composer<_$AppDatabase, $ArchiveTableTable> {
  $$ArchiveTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnFilters(column));
}

class $$ArchiveTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ArchiveTableTable> {
  $$ArchiveTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnOrderings(column));
}

class $$ArchiveTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArchiveTableTable> {
  $$ArchiveTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => column);
}

class $$ArchiveTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArchiveTableTable,
    ArchiveTableData,
    $$ArchiveTableTableFilterComposer,
    $$ArchiveTableTableOrderingComposer,
    $$ArchiveTableTableAnnotationComposer,
    $$ArchiveTableTableCreateCompanionBuilder,
    $$ArchiveTableTableUpdateCompanionBuilder,
    (
      ArchiveTableData,
      BaseReferences<_$AppDatabase, $ArchiveTableTable, ArchiveTableData>
    ),
    ArchiveTableData,
    PrefetchHooks Function()> {
  $$ArchiveTableTableTableManager(_$AppDatabase db, $ArchiveTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArchiveTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArchiveTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArchiveTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<double?> priceOfSom = const Value.absent(),
          }) =>
              ArchiveTableCompanion(
            id: id,
            barcode: barcode,
            product: product,
            priceOfSom: priceOfSom,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            required String product,
            Value<double?> priceOfSom = const Value.absent(),
          }) =>
              ArchiveTableCompanion.insert(
            id: id,
            barcode: barcode,
            product: product,
            priceOfSom: priceOfSom,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ArchiveTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArchiveTableTable,
    ArchiveTableData,
    $$ArchiveTableTableFilterComposer,
    $$ArchiveTableTableOrderingComposer,
    $$ArchiveTableTableAnnotationComposer,
    $$ArchiveTableTableCreateCompanionBuilder,
    $$ArchiveTableTableUpdateCompanionBuilder,
    (
      ArchiveTableData,
      BaseReferences<_$AppDatabase, $ArchiveTableTable, ArchiveTableData>
    ),
    ArchiveTableData,
    PrefetchHooks Function()>;
typedef $$StorageTableTableCreateCompanionBuilder = StorageTableCompanion
    Function({
  Value<int> id,
  Value<String?> barcode,
  required String product,
  required int quantity,
  Value<double?> priceOfSom,
});
typedef $$StorageTableTableUpdateCompanionBuilder = StorageTableCompanion
    Function({
  Value<int> id,
  Value<String?> barcode,
  Value<String> product,
  Value<int> quantity,
  Value<double?> priceOfSom,
});

class $$StorageTableTableFilterComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnFilters(column));
}

class $$StorageTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnOrderings(column));
}

class $$StorageTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => column);
}

class $$StorageTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StorageTableTable,
    StorageTableData,
    $$StorageTableTableFilterComposer,
    $$StorageTableTableOrderingComposer,
    $$StorageTableTableAnnotationComposer,
    $$StorageTableTableCreateCompanionBuilder,
    $$StorageTableTableUpdateCompanionBuilder,
    (
      StorageTableData,
      BaseReferences<_$AppDatabase, $StorageTableTable, StorageTableData>
    ),
    StorageTableData,
    PrefetchHooks Function()> {
  $$StorageTableTableTableManager(_$AppDatabase db, $StorageTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double?> priceOfSom = const Value.absent(),
          }) =>
              StorageTableCompanion(
            id: id,
            barcode: barcode,
            product: product,
            quantity: quantity,
            priceOfSom: priceOfSom,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            required String product,
            required int quantity,
            Value<double?> priceOfSom = const Value.absent(),
          }) =>
              StorageTableCompanion.insert(
            id: id,
            barcode: barcode,
            product: product,
            quantity: quantity,
            priceOfSom: priceOfSom,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StorageTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StorageTableTable,
    StorageTableData,
    $$StorageTableTableFilterComposer,
    $$StorageTableTableOrderingComposer,
    $$StorageTableTableAnnotationComposer,
    $$StorageTableTableCreateCompanionBuilder,
    $$StorageTableTableUpdateCompanionBuilder,
    (
      StorageTableData,
      BaseReferences<_$AppDatabase, $StorageTableTable, StorageTableData>
    ),
    StorageTableData,
    PrefetchHooks Function()>;
typedef $$SalesTableTableCreateCompanionBuilder = SalesTableCompanion Function({
  Value<int> id,
  Value<DateTime?> date,
  Value<double?> sumBasket,
  Value<String?> barcode,
  required String product,
  required int quantity,
  Value<double?> priceOfSom,
  Value<double?> course,
});
typedef $$SalesTableTableUpdateCompanionBuilder = SalesTableCompanion Function({
  Value<int> id,
  Value<DateTime?> date,
  Value<double?> sumBasket,
  Value<String?> barcode,
  Value<String> product,
  Value<int> quantity,
  Value<double?> priceOfSom,
  Value<double?> course,
});

class $$SalesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sumBasket => $composableBuilder(
      column: $table.sumBasket, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get course => $composableBuilder(
      column: $table.course, builder: (column) => ColumnFilters(column));
}

class $$SalesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sumBasket => $composableBuilder(
      column: $table.sumBasket, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get course => $composableBuilder(
      column: $table.course, builder: (column) => ColumnOrderings(column));
}

class $$SalesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get sumBasket =>
      $composableBuilder(column: $table.sumBasket, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get priceOfSom => $composableBuilder(
      column: $table.priceOfSom, builder: (column) => column);

  GeneratedColumn<double> get course =>
      $composableBuilder(column: $table.course, builder: (column) => column);
}

class $$SalesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalesTableTable,
    SalesTableData,
    $$SalesTableTableFilterComposer,
    $$SalesTableTableOrderingComposer,
    $$SalesTableTableAnnotationComposer,
    $$SalesTableTableCreateCompanionBuilder,
    $$SalesTableTableUpdateCompanionBuilder,
    (
      SalesTableData,
      BaseReferences<_$AppDatabase, $SalesTableTable, SalesTableData>
    ),
    SalesTableData,
    PrefetchHooks Function()> {
  $$SalesTableTableTableManager(_$AppDatabase db, $SalesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<double?> sumBasket = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String> product = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double?> priceOfSom = const Value.absent(),
            Value<double?> course = const Value.absent(),
          }) =>
              SalesTableCompanion(
            id: id,
            date: date,
            sumBasket: sumBasket,
            barcode: barcode,
            product: product,
            quantity: quantity,
            priceOfSom: priceOfSom,
            course: course,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<double?> sumBasket = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            required String product,
            required int quantity,
            Value<double?> priceOfSom = const Value.absent(),
            Value<double?> course = const Value.absent(),
          }) =>
              SalesTableCompanion.insert(
            id: id,
            date: date,
            sumBasket: sumBasket,
            barcode: barcode,
            product: product,
            quantity: quantity,
            priceOfSom: priceOfSom,
            course: course,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SalesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalesTableTable,
    SalesTableData,
    $$SalesTableTableFilterComposer,
    $$SalesTableTableOrderingComposer,
    $$SalesTableTableAnnotationComposer,
    $$SalesTableTableCreateCompanionBuilder,
    $$SalesTableTableUpdateCompanionBuilder,
    (
      SalesTableData,
      BaseReferences<_$AppDatabase, $SalesTableTable, SalesTableData>
    ),
    SalesTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArchiveTableTableTableManager get archiveTable =>
      $$ArchiveTableTableTableManager(_db, _db.archiveTable);
  $$StorageTableTableTableManager get storageTable =>
      $$StorageTableTableTableManager(_db, _db.storageTable);
  $$SalesTableTableTableManager get salesTable =>
      $$SalesTableTableTableManager(_db, _db.salesTable);
}
