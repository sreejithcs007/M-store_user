import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/shared/repo/authorised/notification/repo.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final repo = NotificationRepo();

  /// Grouped by date: "2025-07-20" → List of maps with title/message etc.
  Map<String, List<Map<String, Object>>> groupedNotifications = {};

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  void loadNotifications() async {
    final value = await repo.getAllNotification();

    Map<String, List<Map<String, Object>>> grouped = {};

    for (var e in value) {
      final createdAt = e.createdAt ?? DateTime.now();
      final dateKey = "${createdAt.year}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}";

      grouped.putIfAbsent(dateKey, () => []).add({
        'iconText': e.status == "unread" ? "UR" : "R",
        'title': e.title ?? '',
        'subtitle': e.message ?? '',
        'color': e.status == "unread" ? Colors.blue : Colors.grey,
        'createdAt': createdAt,
      });
    }

    // Sort by date descending
    final sortedMap = Map.fromEntries(
      grouped.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key)),
    );

    setState(() {
      groupedNotifications = sortedMap;
    });
  }

  String formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "", // dummy for index 0
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications', style: AppTextStyle().br16w400),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: groupedNotifications.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: groupedNotifications.entries.map((entry) {
                final date = DateTime.parse(entry.key);
                final dateFormatted = formatDate(date);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        dateFormatted,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ...entry.value.asMap().entries.map((entryItem) {
                      final item = entryItem.value;
                      final index = entryItem.key;
                      final backgroundColor =
                          index % 2 == 0 ? Colors.white : Colors.grey[200];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          tileColor: backgroundColor,
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Text(
                                item['iconText'].toString(),
                                style: TextStyle(
                                  color: item['color'] as Color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            item['title'].toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item['subtitle'].toString()),
                        ),
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ),
    );
  }
}
