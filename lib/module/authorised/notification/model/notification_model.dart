import 'dart:ui';

class AppNotification {
  final String code;         
  final String title;        
  final String subtitle;    
  final Color color;         

  AppNotification({
    required this.code,
    required this.title,
    required this.subtitle,
    required this.color, required int id,
  });
}
