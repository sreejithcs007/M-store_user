// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    List<CartItem>? cartItems;

    CartModel({
        this.cartItems,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cart_items": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
    };
}

class CartItem {
    int? id;
    int? userId;
    int? productId;
    int? quantity;
    String? purchaseStatus;
    DateTime? createdAt;
    DateTime? updatedAt;
    Product? product;

    CartItem({
        this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.purchaseStatus,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        purchaseStatus: json["purchase_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "purchase_status": purchaseStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
    };
}

class Product {
    int? id;
    dynamic itemCode;
    String? name;
    dynamic itemType;
    String? description;
    dynamic manufacturer;
    dynamic expiryDate;
    String? price;
    int? categoryId;
    String? discount;
    int? stock;
    List<String>? images;
    dynamic colors;
    dynamic sizes;
    String? averageRating;
    int? totalReviews;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic hsnCode;
    String? salesRate;
    String? purchaseRate;
    String? gstAmount;
    int? quantity;
    String? quantityUnit;
    String? productType;
    bool? isFavorited;

    Product({
        this.id,
        this.itemCode,
        this.name,
        this.itemType,
        this.description,
        this.manufacturer,
        this.expiryDate,
        this.price,
        this.categoryId,
        this.discount,
        this.stock,
        this.images,
        this.colors,
        this.sizes,
        this.averageRating,
        this.totalReviews,
        this.createdAt,
        this.updatedAt,
        this.hsnCode,
        this.salesRate,
        this.purchaseRate,
        this.gstAmount,
        this.quantity,
        this.quantityUnit,
        this.productType,
        this.isFavorited,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        itemCode: json["item_code"],
        name: json["name"],
        itemType: json["item_type"],
        description: json["description"],
        manufacturer: json["manufacturer"],
        expiryDate: json["expiry_date"],
        price: json["price"],
        categoryId: json["category_id"],
        discount: json["discount"],
        stock: json["stock"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        colors: json["colors"],
        sizes: json["sizes"],
        averageRating: json["average_rating"],
        totalReviews: json["total_reviews"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        hsnCode: json["hsn_code"],
        salesRate: json["sales_rate"],
        purchaseRate: json["purchase_rate"],
        gstAmount: json["gst_amount"],
        quantity: json["quantity"],
        quantityUnit: json["quantity_unit"],
        productType: json["product_type"],
        isFavorited: json["is_favorited"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_code": itemCode,
        "name": name,
        "item_type": itemType,
        "description": description,
        "manufacturer": manufacturer,
        "expiry_date": expiryDate,
        "price": price,
        "category_id": categoryId,
        "discount": discount,
        "stock": stock,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "colors": colors,
        "sizes": sizes,
        "average_rating": averageRating,
        "total_reviews": totalReviews,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hsn_code": hsnCode,
        "sales_rate": salesRate,
        "purchase_rate": purchaseRate,
        "gst_amount": gstAmount,
        "quantity": quantity,
        "quantity_unit": quantityUnit,
        "product_type": productType,
        "is_favorited": isFavorited,
    };
}
