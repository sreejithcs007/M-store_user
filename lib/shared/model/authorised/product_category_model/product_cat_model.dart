// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromJson(jsonString);

import 'dart:convert';

List<ProductCategoryModel> productCategoryModelFromJson(String str) => List<ProductCategoryModel>.from(json.decode(str).map((x) => ProductCategoryModel.fromJson(x)));

String productCategoryModelToJson(List<ProductCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategoryModel {
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

    ProductCategoryModel({
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

    factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
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
