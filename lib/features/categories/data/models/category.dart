import '../../../../core/models/base_model.dart';
import '../../../products/data/models/product.dart';

class Category extends BaseModel {
  String? id;
  String? name;
  final int? status;
  String? imageName;
  final List<Product> products;
  static String filterTypeName = "category";
  static String subCategoryFilterTypeName = "subcategory";

  Category({
    this.id,
    this.name,
    this.status,
    this.imageName,
    this.products = const [],
  }) ;

  factory Category.init() {
    return Category(
      id: '',
      name: '',
      status: -1,
      products: const [],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'category_id': id,
      };

  @override
  List<Category> fromList(List items) {
    return items.map<Category>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Category(
      id: map.containsKey('id') ? map['id']: '',
      name: map.containsKey('name') ? map['name']: null,
      status: map.containsKey('status') ? map['status']: null,
      imageName: map.containsKey('image_name') ? map['image_name']: null,
      products: map.containsKey('products') && map['products'] != null
          ? Product.init().fromList(map['products'])
          : [],
    );
  }

  @override
  List<Object?> get props =>
      [id,name, imageName, name];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status;

  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ name.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'Category{id: $id, name: $name, status: $status, imageName: $imageName, products: ${products.toString()}}';
  }
}
