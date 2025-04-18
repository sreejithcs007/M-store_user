

class CategoryListModel {
    int? id;
    String? name;
    String? description;
    String? image;
    dynamic parentId;
    DateTime? createdAt;
    DateTime? updatedAt;

    CategoryListModel({
        this.id,
        this.name,
        this.description,
        this.image,
        this.parentId,
        this.createdAt,
        this.updatedAt,
    });

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "parent_id": parentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
