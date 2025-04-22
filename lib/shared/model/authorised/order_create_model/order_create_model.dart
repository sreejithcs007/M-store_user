

class OrderCreateModel {
    int? userId;
    String? paymentMethod;
    List<Item>? items;

    OrderCreateModel({
        this.userId,
        this.paymentMethod,
        this.items,
    });

    factory OrderCreateModel.fromJson(Map<String, dynamic> json) => OrderCreateModel(
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "payment_method": paymentMethod,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    int? productId;
    int? quantity;
    int? price;

    Item({
        this.productId,
        this.quantity,
        this.price,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
    };
}
