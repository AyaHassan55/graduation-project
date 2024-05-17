import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../model/notification_model.dart';

class LocalNotificationService {
 static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 static onTap(NotificationResponse details){}
 static Future<void> init() async{
   const InitializationSettings settings= InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"),);
   await flutterLocalNotificationsPlugin.initialize(
       settings, onDidReceiveNotificationResponse: (details){},
       onDidReceiveBackgroundNotificationResponse: onTap,);
 }
 static List<NotificationModel> storedNotifications = [];
 static void showNotification(String message) async{

   NotificationDetails details=const NotificationDetails(android: AndroidNotificationDetails('id 1','yarab '));
   await flutterLocalNotificationsPlugin.show(0, 'Hi,Aya', 'Attention Alert: "Heads up! 1 students in the back row seem to be losing focus. Consider checking in or changing topics."', details);
   NotificationModel notification = NotificationModel(
     message: message,
     time: DateTime.now(),
   );
   storedNotifications.add(notification);

 }
 static List<NotificationModel> getNotifications() {
   return storedNotifications;
 }
}

