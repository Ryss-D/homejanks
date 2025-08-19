import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

// Define the products table to match ProductEntity structure
@DataClassName('Product')
class Products extends Table {
  IntColumn get id => integer()();
  TextColumn get productId => text()();
  TextColumn get merchantCategoryId => text()();
  TextColumn get skuId => text()();
  IntColumn get position => integer()();
  BoolColumn get isPrimeEligible => boolean()();
  TextColumn get displayName => text()();
  TextColumn get brand => text()();
  TextColumn get model => text()();
  TextColumn get mediaJson => text()(); // JSON string for MediaEntity
  TextColumn get badgesJson => text()(); // JSON string for List<String>
  TextColumn get fastShippingLabelsJson => text()(); // JSON string for FastShippingLabelsEntity
  TextColumn get eventsJson => text()(); // JSON string for List<EventEntity>
  TextColumn get pricesJson => text()(); // JSON string for List<PriceEntity>
  TextColumn get totalReviews => text()();
  TextColumn get rating => text()();
  TextColumn get variantsJson => text()(); // JSON string for List<String>
  TextColumn get multiPurposeIconJson => text()(); // JSON string for Map<String, dynamic>
  TextColumn get bankBadgeJson => text().nullable()(); // JSON string for BankBadgeEntity?
  TextColumn get highlightsJson => text()(); // JSON string for List<HighlightEntity>
  TextColumn get accumulativePointsJson => text()(); // JSON string for List<String>
  BoolColumn get isPromoted => boolean()();
  BoolColumn get isInternational => boolean()();
  TextColumn get installmentsJson => text()(); // JSON string for Map<String, dynamic>
  TextColumn get mediaUrlsJson => text()(); // JSON string for List<String>
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// Define the cart items table
@DataClassName('CartItem')
class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get quantity => integer()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Products, CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Increment schema version for migration

  // Product operations
  Future<List<Product>> getAllProducts() => select(products).get();
  
  Future<Product?> getProductById(int id) => 
      (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<List<Product>> searchProducts(String query) =>
      (select(products)..where((p) => p.displayName.contains(query) | p.brand.contains(query))).get();

  Future<int> insertProduct(ProductsCompanion product) => 
      into(products).insert(product, mode: InsertMode.insertOrReplace);

  Future<void> insertProducts(List<ProductsCompanion> productList) =>
      batch((batch) {
        batch.insertAll(products, productList, mode: InsertMode.insertOrReplace);
      });

  Future<void> clearProductsCache() => delete(products).go();

  // Cart operations
  Future<List<CartItem>> getAllCartItems() => select(cartItems).get();

  Future<CartItem?> getCartItem(int productId) =>
      (select(cartItems)..where((c) => c.productId.equals(productId))).getSingleOrNull();

  Future<int> addToCart(int productId, int quantity) async {
    final existingItem = await getCartItem(productId);
    
    if (existingItem != null) {
      return await (update(cartItems)
        ..where((c) => c.productId.equals(productId)))
        .write(CartItemsCompanion(quantity: Value(existingItem.quantity + quantity)));
    } else {
      return await into(cartItems).insert(CartItemsCompanion(
        productId: Value(productId),
        quantity: Value(quantity),
      ));
    }
  }

  Future<int> updateCartItemQuantity(int productId, int quantity) =>
      (update(cartItems)..where((c) => c.productId.equals(productId)))
          .write(CartItemsCompanion(quantity: Value(quantity)));

  Future<int> removeFromCart(int productId) =>
      (delete(cartItems)..where((c) => c.productId.equals(productId))).go();

  Future<void> clearCart() => delete(cartItems).go();

  // Get cart items with product details
  Future<List<CartItemWithProduct>> getCartItemsWithProducts() {
    final query = select(cartItems).join([
      leftOuterJoin(products, products.id.equalsExp(cartItems.productId)),
    ]);

    return query.map((row) {
      final cartItem = row.readTable(cartItems);
      final product = row.readTable(products);
      
      return CartItemWithProduct(
        cartItem: cartItem,
        product: product,
      );
    }).get();
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Drop old tables and recreate with new schema
          await m.drop(products);
          await m.drop(cartItems);
          await m.createAll();
        }
      },
    );
  }
}

class CartItemWithProduct {
  final CartItem cartItem;
  final Product product;

  CartItemWithProduct({
    required this.cartItem,
    required this.product,
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ecommerce.db'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
