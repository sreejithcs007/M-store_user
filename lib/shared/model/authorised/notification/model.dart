
class NotificationListModel {
    List<Notification>? notifications;

    NotificationListModel({
        this.notifications,
    });

    factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
        notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
    };
}

class Notification {
    int? id;
    String? title;
    String? message;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Notification({
        this.id,
        this.title,
        this.message,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
