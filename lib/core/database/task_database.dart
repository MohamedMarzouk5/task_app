import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/home/data/model/task_modl.dart';

class ProductDatabaseHelper {
  final String tableTodo = 'todo';
  final String columnDate = 'date';
  final String columnTitle = 'title';
  final String columnIsSynced = 'isSynced';

  static Database? _database;

  static final ProductDatabaseHelper db = ProductDatabaseHelper._();
  ProductDatabaseHelper._();

  Future<Database> get database async => _database ??= await initDb();

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //create tables
      await db.execute('''
      CREATE TABLE $tableTodo (
        $columnTitle TEXT NOT NULL,
        $columnDate TEXT NOT NULL,
        $columnIsSynced INTEGER NOT NULL)
       ''');
    }, onUpgrade: (Database db, int oldV, int newV) async {
      if (oldV < newV) {
        await db.execute("alter table courses add column level varchar(50) ");
      }
    });
  }

  Future<List<Task>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableTodo);
    List<Task> list =
        maps.isNotEmpty ? maps.map((task) => Task.fromMap(task)).toList() : [];
    return list;
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Task>> queryProduct(String model) async {
    var dbClient = await database;
    // final List<Map<String, dynamic>> maps = await dbClient.query(tableProduct!);

    List<Map> map = await dbClient
        .rawQuery('SELECT * FROM product WHERE barcodeNumber=?', [model]);
    List<Task> list =
        map.isNotEmpty ? map.map((task) => Task.fromMap(task)).toList() : [];

    return list;
  }

  // Future<Task> getProductModel(String model) async {
  //   Task taskModel = Task();
  //   productModel.name = '';
  //   var dbClient = await database;
  //   List<Map> maps = await dbClient.query(tableTodo,
  //       // columns: [columnId, columnDone, columnTitle],
  //       where: '$column = ?',
  //       whereArgs: [model]);
  //   if (maps.isNotEmpty) {
  //     productModel = ProductModel.fromJson(maps.first);
  //     return productModel;
  //   }
  //   return productModel;
  // }

  insert(Task model) async {
    var dbClient = await database;
    await dbClient.insert(tableTodo, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateProduct(Task model) async {
    var dbClient = await database;
    return await dbClient.update(tableTodo, model.toMap(),
        where: '$columnIsSynced = ?', whereArgs: [model.isSynced]);
  }

  // deleteProduct(Task model) async {
  //   var dbClient = await database;
  //   return await dbClient.delete(tableTodo!,
  //       where: '$columnbarcodeNumber = ?', whereArgs: [model.barcodeNumber]);
  //   // dbClient.update(tableProduct!, model.toJson(),
  //   //     where: '$columnbarcodeNumber = ?', whereArgs: [model.barcodeNumber]);
  // }

  // return maps
  //     .map((e) => Model(
  //         id: e["id"], fruitName: e["fruitName"], quantity: e["quantity"]))
  //     .toList();
}
