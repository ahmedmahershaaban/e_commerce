import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $kTableCartProduct (
      $kColumnId INT NOT NULL,
      $kColumnTitle TEXT NOT NULL,
      $kColumnColor TEXT NOT NULL,
      $kColumnImage TEXT NOT NULL,
      $kColumnPrice INT NOT NULL,
      $kColumnQuantity INT NOT NULL)
      ''');
    });
  }

  Future<List<CartProductModel>> getAllProducts() async {
    final dbClient = await database;
    List<Map> maps = await dbClient!.query(kTableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(kTableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  update(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.update(kTableCartProduct, model.toJson(),
        where: '$kColumnId = ?', whereArgs: [model.id]);
  }

  delete(int id) async {
    var dbClient = await database;
    await dbClient!
        .delete(kTableCartProduct, where: '$kColumnId = ?', whereArgs: [id]);
  }
}
