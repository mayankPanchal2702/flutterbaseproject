import 'dart:async';

import 'package:path/path.dart';
import 'package:soleoserp/models/common/inquiry_product_model.dart';
import 'package:soleoserp/models/common/mayank_inquiry_product_model.dart';
import 'package:sqflite/sqflite.dart';

class Mayank_OfflineDbHelper {
  static Mayank_OfflineDbHelper _offlineDbHelper;
  static Database database;

  static const TABLE_INQUIRY_PRODUCT = "inquiry_product";

  static createInstance() async {
    _offlineDbHelper = Mayank_OfflineDbHelper();
    database = await openDatabase(
        join(await getDatabasesPath(), 'soleoserp_database.db'),
        onCreate: (db, version) => _createDb(db),
        version: 14);
  }

  static void _createDb(Database db) {
    db.execute(
      'CREATE TABLE $TABLE_INQUIRY_PRODUCT(id INTEGER PRIMARY KEY AUTOINCREMENT, InquiryNo TEXT,LoginUserID TEXT, CompanyId TEXT, ProductName TEXT, ProductID TEXT, Quantity TEXT, UnitPrice TEXT,TotalAmount TEXT)',
    );

    //
  }

  static Mayank_OfflineDbHelper getInstance() {
    return _offlineDbHelper;
  }

  ///Here InquiryProduct Table Implimentation

  Future<int> insertMayankInquiryProduct(
      MayankInquiryProductModel model) async {
    final db = await database;

    return await db.insert(
      TABLE_INQUIRY_PRODUCT,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MayankInquiryProductModel>> getInquiryProduct() async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query(TABLE_INQUIRY_PRODUCT);

    return List.generate(maps.length, (i) {
      return MayankInquiryProductModel(
        maps[i]['InquiryNo'],
        maps[i]['LoginUserID'],
        maps[i]['CompanyId'],
        maps[i]['ProductName'],
        maps[i]['ProductID'],
        maps[i]['Quantity'],
        maps[i]['UnitPrice'],
        maps[i]['TotalAmount'],
        id: maps[i]['id'],
      );
    });
  }

  Future<void> updateMayankInquiryProduct(InquiryProductModel model) async {
    final db = await database;

    await db.update(
      TABLE_INQUIRY_PRODUCT,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteMayankInquiryProduct(int id) async {
    final db = await database;

    await db.delete(
      TABLE_INQUIRY_PRODUCT,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteALLMayankInquiryProduct() async {
    final db = await database;

    await db.delete(TABLE_INQUIRY_PRODUCT);
  }
}
