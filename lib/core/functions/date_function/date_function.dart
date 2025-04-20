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