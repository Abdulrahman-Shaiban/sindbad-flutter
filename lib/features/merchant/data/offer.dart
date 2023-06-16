import '../../../../core/models/base_model.dart';
import '../../products/data/models/product_image.dart';

class Offer extends BaseModel {
  String? id;
  String? categoryName;
  String? details;
  List<ProductImage>? images =[];

  Offer({
    this.id,
    this.categoryName,
    this.details,
    this.images,
  });

  factory Offer.init() {
    return Offer(
      id: '',
      categoryName: '',
      details: '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'category_name': categoryName,
        'details': details,
      };

  @override
  List<Offer> fromList(List items) {
    return items.map<Offer>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Offer(
      id: map.containsKey('id') ? map['id'] : '',
      categoryName:
          map.containsKey('category_name') ? map['category_name'] : null,
      details: map.containsKey('details') ? map['details'] : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Offer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          details == other.details;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ details.hashCode;

  @override
  String toString() {
    return 'Offer{id: $id, categoryName: $categoryName, details: $details}';
  }
}
