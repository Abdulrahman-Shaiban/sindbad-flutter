import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../../core/models/base_model.dart';
import '../../../products/data/models/product_image.dart';
import '../../../supplier/data/models/supplier.dart';

class OrderProduct extends BaseModel {
  String? id;
  String? orderNumber;
  String? name;
  String? description;
  String? price;
  double? specialPrice;
  num? total;
  DateTime? expireDate;
  FavoriteStatus favoriteStatus;
  num ratingAverage;
  int totalRatingsNumber;

  int? categoryId;
  String? categoryName;
  String? subCategoryName;
  int? supplierId;
  String? supplierName;
  int? brandId;
  String? brandName;
  int availableQuantity = 1;
  int selectedQuantity = 1;
  String? createdAt, updatedAt;
  List<ProductImage> productImages;
  Supplier? supplier;
  num ratingValue=0.0;


  OrderProduct({
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
    this.categoryId,
    this.categoryName,
    this.subCategoryName,
    this.supplierId,
    this.supplierName,
    this.brandId,
    this.brandName,
    this.createdAt,
    this.updatedAt,
    this.supplier,
    this.productImages = const [],
    this.ratingValue = 0.0,
  });

  factory OrderProduct.init() {
    return OrderProduct(
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
  List<OrderProduct> fromList(List items) {
    return items.map<OrderProduct>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return OrderProduct(
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
      brandName: map.containsKey('brand_name') ? map['brand_name'] : null,
      createdAt: map.containsKey('created_at') ? map['created_at'] : null,
      updatedAt: map.containsKey('updated_at') ? map['updated_at'] : null,
      ratingValue: map.containsKey('rating_value') ? map['rating_value'] : null,
      supplier: map.containsKey('supplier') && map['supplier'] != null
          ? Supplier.init().fromMap(map['supplier'])
          : null,
      productImages: map.containsKey('images') && map['images'] != null
          ? ProductImage().fromList(map['images'])
          : [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is OrderProduct &&
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
          brandName == other.brandName &&
          selectedQuantity == other.selectedQuantity &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          productImages == other.productImages &&
          supplier == other.supplier;

  @override
  int get hashCode =>
      super.hashCode ^
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
      brandName.hashCode ^
      selectedQuantity.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      productImages.hashCode ^
      supplier.hashCode;

  @override
  String toString() {
    return 'OrderProduct{id: $id orderNumber: $orderNumber, name: $name, description: $description, price: $price, specialPrice: $specialPrice, total: $total, expireDate: $expireDate, favoriteStatus: $favoriteStatus, ratingAverage: $ratingAverage, totalRatingsNumber: $totalRatingsNumber,categoryId: $categoryId, categoryName: $categoryName, supplierId: $supplierId, supplierName: $supplierName, brandId: $brandId, brandName: $brandName, availableQuantity: $availableQuantity, selectedQuantity: $selectedQuantity, createdAt: $createdAt, updatedAt: $updatedAt,productImages: ${productImages.toString()}, supplier: ${supplier.toString()}}';
  }
}
