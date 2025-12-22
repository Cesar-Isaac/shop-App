class CartModel {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartItem>? products;

  CartModel({this.id, this.userId, this.date, this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      products:
          (json['products'] as List?)
              ?.map((e) => CartItem.fromJson(e))
              .toList(),
    );
  }

  static List<CartModel> listFromJson(List list) =>
      list.map((e) => CartModel.fromJson(e)).toList();
}

class CartItem {
  final int? productId;
  final int? quantity;

  CartItem({this.productId, this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as int?,
      quantity: json['quantity'] as int?,
    );
  }
}

class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
    );
  }

  static List<ProductModel> listFromJson(List list) =>
      list.map((e) => ProductModel.fromJson(e)).toList();
}
