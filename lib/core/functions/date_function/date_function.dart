import 'package:intl/intl.dart';

String formatDateFromEpoch(String? milliseconds) {
  if (milliseconds == null) return "Invalid date";
  try {
    final epoch = int.parse(milliseconds);
    final date = DateTime.fromMillisecondsSinceEpoch(epoch);
    return "${date.day.toString().padLeft(2, '0')}/"
           "${date.month.toString().padLeft(2, '0')}/"
           "${date.year}";
  } catch (e) {
    return "Invalid date";
  }
}




String? formatTimestamp(String? timestamp) {
  if (timestamp == null || timestamp.isEmpty) return null;

  try {
    DateTime dateTime = DateTime.parse(timestamp).toLocal();
    return DateFormat('dd/MM/yyyy hh.mm a').format(dateTime);
  } catch (e) {
    return null; // In case of parsing error
  }
}


String? capitalizeFirst(String? value) {
  if (value == null || value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1);
}