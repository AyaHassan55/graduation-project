import 'package:flutter/material.dart';

import '../components/consts.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image(image: Svg('assets/images/girll.svg')),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 100,
                height: 100,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:AssetImage('assets/images/profile_aya.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                textAlign: TextAlign.start,
                cursorColor:Colors.black,
                cursorRadius: const Radius.circular(2),
                decoration: InputDecoration(

                  enabledBorder:myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Enter Your  Name',
                  labelStyle:const TextStyle(color: Colors.black),
                  prefixIcon:const Icon(Icons.person_2_outlined,color: Colors.black,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                cursorColor:Colors.black,
                cursorRadius: const Radius.circular(2),
                decoration: InputDecoration(

                  enabledBorder:myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Enter Email',
                  labelStyle:const TextStyle(color: Colors.black),
                  prefixIcon:const Icon(Icons.email_outlined,color:Colors.black,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.start,
                cursorColor:Colors.black,
                cursorRadius: const Radius.circular(2),
                decoration: InputDecoration(


                  enabledBorder:myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Enter Phone Number',
                  labelStyle:const TextStyle(color: Colors.black),
                  prefixIcon:const Icon(Icons.local_phone_rounded,color: Colors.black,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(width: double.infinity,height: 50,child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(22)))), child:const Text('Update',style: TextStyle(color: Colors.white),),)),
            ),

          ],
        ),
      ),
    );
  }
}
