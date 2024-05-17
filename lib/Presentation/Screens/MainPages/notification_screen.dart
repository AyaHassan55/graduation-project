import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/model/notification_model.dart';
import '../../../core/notification/notification_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notifications = LocalNotificationService.getNotifications();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 20),),

        leading:  InkWell(onTap: (){
          Navigator.pop(context);
        },
            child:const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              child: ListTile(
                leading: Image.asset('assets/images/warning.png'),
                title: Text(notification.message),
                // subtitle: Text(notification.time.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}


