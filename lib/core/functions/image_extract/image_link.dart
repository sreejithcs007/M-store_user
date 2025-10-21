import 'package:ecommerce/core/dev_tools/dev_tools.dart';

// String formatImageUrl(String? originalUrl) {
//   const newBaseUrl = 'https://mstoremart.de/storage/app/public/';

//   if (originalUrl == null || originalUrl.isEmpty) return '';

//   final storageIndex = originalUrl.indexOf('/storage/');
//   if (storageIndex != -1) {
//     final pathAfterStorage = originalUrl.substring(storageIndex + 9);
//     devPrintSuccess('image link --> $newBaseUrl$pathAfterStorage');
//     return '$newBaseUrl$pathAfterStorage';
//   }

//   return '';
// }


String formatImageUrl(String? originalUrl) {
  const newBaseUrl = 'https://mstoremart.in/storage/app/public/';

  if (originalUrl == null || originalUrl.isEmpty) return '';

  // If /storage/ exists, strip and append only the path after it
  final storageIndex = originalUrl.indexOf('/storage/');
  if (storageIndex != -1) {
    final pathAfterStorage = originalUrl.substring(storageIndex + 9);
    // devPrintSuccess('Formatted with /storage/: $newBaseUrl$pathAfterStorage');
    return '$newBaseUrl$pathAfterStorage';
  }

  // If no /storage/ exists, just add the whole path after the base URL
  // devPrintSuccess('Formatted without /storage/: $newBaseUrl$originalUrl');
  return '$newBaseUrl$originalUrl';
}
