import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../../core/models/base_model.dart';
import '../../../favorites/views/widgets/product_change_favorite_status_widget.dart';
import 'product_image.dart';

class Product extends BaseModel {
  String? id;
  String? orderNumber;
  String? name;
  String? description;
  String? price;
  double? specialPrice;
  num? total;
  DateTime? expireDate;
  FavoriteStatus favoriteStatus;
  String? productStatus;
  num ratingAverage;
  int totalRatingsNumber;

  // ProductStatus? status;
  // Driver? driver;
  int? categoryId;
  String? categoryName;
  String? subCategoryName;
  int? supplierId;
  String? supplierName;
  int? brandId;
  int availableQuantity = 1;
  int selectedQuantity = 1;
  String? createdAt, updatedAt;
  List<ProductImage> productImages;
  // Supplier? supplier;

  Product({
    this.id,
    this.orderNumber,
    this.name,
    this.description,
    this.price,
    this.total,
    this.specialPrice,
    this.availableQuantity = 1,
    this.selectedQuantity = 1,
    this.expireDate,
    this.favoriteStatus= FavoriteStatus.notFavorite,
    this.ratingAverage = 0,
    this.totalRatingsNumber = 0,
    this.productStatus,
    // this.driver,
    // this.status,
    this.categoryId,
    this.categoryName,
    this.subCategoryName,
    this.supplierId,
    this.supplierName,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    // this.supplier,
    this.productImages = const [],
  });

  factory Product.init() {
    return Product(
      id: '',
      name: '',
      description: '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    'product_id': id,
  };

  @override
  List<Product> fromList(List items) {
    return items.map<Product>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Product(
      id: map.containsKey('id') ? map['id'] : null,
      orderNumber: map.containsKey('order_no') ? map['order_no'] : null,
      name: map.containsKey('name') ? map['name'] : null,
      description: map.containsKey('description') ? map['description']: null,
      specialPrice: (map['special_price'] != null &&
          (map['special_price'] as String).isNotEmpty &&
          double.parse(map['special_price']) != 0.0)
          ? double.parse(map['special_price'])
          : null,
      price: map.containsKey('price') ? map['price'] : null,
      total: map.containsKey('total') && map['total'] != null
          ? map['total']
          : null,
      favoriteStatus: map.containsKey('is_favorite') && map['is_favorite'] != null
          ? FavoriteStatus.values[map['is_favorite']]
          : FavoriteStatus.notFavorite,
      selectedQuantity: map.containsKey('quantity') && map['quantity'] != null
          ? map['quantity']
          : 1,
      availableQuantity: map.containsKey('available_quantity') &&
          map['available_quantity'] != null
          ? map['available_quantity']
          : 1,
      expireDate: map.containsKey('expire_date') && map['expire_date'] != null
          ? DateTime.parse(map['expire_date'])
          : null,
      categoryId: map.containsKey('category_id') ? map['category_id'] : null,
      supplierId: map.containsKey('supplier_id') ? map['supplier_id'] : null,
      brandId: map.containsKey('brand_id') ? map['brand_id'] : null,
      categoryName:
      map.containsKey('category_name') ? map['category_name'] : null,
      subCategoryName: map.containsKey('sub_category_name')
          ? map['sub_category_name']
          : null,
      supplierName:
      map.containsKey('supplier_name') ? map['supplier_name'] : null,
      createdAt: map.containsKey('created_at') ? map['created_at'] : null,
      updatedAt: map.containsKey('updated_at') ? map['updated_at'] : null,
      // status: map.containsKey('status') && map['status'] != null
      //     ? ProductStatus.init().fromMap(map['status'])
      //     : null,
      // driver: map.containsKey('driver') && map['driver'] != null
      //     ? Driver.init().fromMap(map['driver'])
      //     : null,
      // supplier: map.containsKey('supplier') && map['supplier'] != null
      //     ? Supplier.init().fromMap(map['supplier'])
      //     : null,
      // productImages: map.containsKey('images') && map['images'] != null
      //     ? ProductImage().fromList(map['images'])
      //     : [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              description == other.description &&
              price == other.price &&
              specialPrice == other.specialPrice &&
              expireDate == other.expireDate &&
              categoryId == other.categoryId &&
              categoryName == other.categoryName &&
              supplierId == other.supplierId &&
              supplierName == other.supplierName &&
              brandId == other.brandId &&
              selectedQuantity == other.selectedQuantity &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt ;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      specialPrice.hashCode ^
      expireDate.hashCode ^
      categoryId.hashCode ^
      categoryName.hashCode ^
      supplierId.hashCode ^
      supplierName.hashCode ^
      brandId.hashCode ^
      selectedQuantity.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ;

  @override
  String toString() {
    return 'Product{id: $id, orderNumber: $orderNumber, name: $name, description: $description, price: $price, specialPrice: $specialPrice, total: $total, expireDate: $expireDate, ratingAverage: $ratingAverage, totalRatingsNumber: $totalRatingsNumber, categoryId: $categoryId, categoryName: $categoryName, supplierId: $supplierId, supplierName: $supplierName, brandId: $brandId, availableQuantity: $availableQuantity, selectedQuantity: $selectedQuantity, createdAt: $createdAt, updatedAt: $updatedAt, ';
  }
}
