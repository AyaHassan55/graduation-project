import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListView(
          children:const [
            Text('Today'),
            SizedBox(height: 12,),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            SizedBox(height: 12,),
            Text('Yesterday'),
            SizedBox(height: 12,),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),
            Card( elevation: 2,shadowColor: Colors.grey, child: ListTile(),),

          ],
        ),
      ),
    );
  }
}
