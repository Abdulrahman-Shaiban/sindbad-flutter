
import '../../../../core/models/base_model.dart';

class ProductImage extends BaseModel {
  String? id;
  String? imagePath;

  ProductImage({
    this.id,
    this.imagePath,
  });

  factory ProductImage.init() {
    return ProductImage(
      id: '',
      imagePath: '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'image_path': imagePath,
  };

  @override
  List<ProductImage> fromList(List items) {
    return items.map<ProductImage>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map.containsKey('id') ? map['id']: '',
      imagePath: map.containsKey('image_path') ? map['image_path']: null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is ProductImage &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              imagePath == other.imagePath;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ imagePath.hashCode;

  @override
  String toString() {
    return 'ProductImages{id: $id, url: $imagePath}';
  }
}
