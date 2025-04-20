class OrderDetailsModel {
    OrderDetails? order;

    OrderDetailsModel({
        this.order,
    });

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
        order: json["order"] == null ? null : OrderDetails.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
    };
}

class OrderDetails {
    int? id;
    int? userId;
    String? paymentMethod;
    String? status;
    dynamic deliveryImage;
    dynamic deliveryRemark;
    dynamic deliveredAt;
    String? totalAmount;
    dynamic transactionId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deliveryBoyId;
    String? paymentStatus;
    String? deliveryStatus;
    dynamic collectedByDeliveryBoy;
    List<Item>? items;

    OrderDetails({
        this.id,
        this.userId,
        this.paymentMethod,
        this.status,
        this.deliveryImage,
        this.deliveryRemark,
        this.deliveredAt,
        this.totalAmount,
        this.transactionId,
        this.createdAt,
        this.updatedAt,
        this.deliveryBoyId,
        this.paymentStatus,
        this.deliveryStatus,
        this.collectedByDeliveryBoy,
        this.items,
    });

    factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: json["id"],
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        deliveryImage: json["delivery_image"],
        deliveryRemark: json["delivery_remark"],
        deliveredAt: json["delivered_at"],
        totalAmount: json["total_amount"],
        transactionId: json["transaction_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deliveryBoyId: json["delivery_boy_id"],
        paymentStatus: json["payment_status"],
        deliveryStatus: json["delivery_status"],
        collectedByDeliveryBoy: json["collected_by_delivery_boy"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "payment_method": paymentMethod,
        "status": status,
        "delivery_image": deliveryImage,
        "delivery_remark": deliveryRemark,
        "delivered_at": deliveredAt,
        "total_amount": totalAmount,
        "transaction_id": transactionId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "delivery_boy_id": deliveryBoyId,
        "payment_status": paymentStatus,
        "delivery_status": deliveryStatus,
        "collected_by_delivery_boy": collectedByDeliveryBoy,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    int? id;
    int? orderId;
    int? productId;
    int? quantity;
    String? price;
    String? totalPrice;
    DateTime? createdAt;
    DateTime? updatedAt;
    Product? product;

    Item({
        this.id,
        this.orderId,
        this.productId,
        this.quantity,
        this.price,
        this.totalPrice,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
    };
}

class Product {
    int? id;
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
    List<String>? colors;
    List<String>? sizes;
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

    Product({
        this.id,
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
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
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
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        sizes: json["sizes"] == null ? [] : List<String>.from(json["sizes"]!.map((x) => x)),
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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
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
    };
}
