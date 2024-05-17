import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/routes.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File?file;
  getImage()async{
    final ImagePicker picker = ImagePicker();

// Pick an image.
    final XFile? imageGallery = await picker.pickImage(source: ImageSource.gallery);

// Capture a photo.
    final XFile? imageCamera = await picker.pickImage(source: ImageSource.camera);
    file=File(imageCamera!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:InkWell(onTap: (){router.pop();router.go('/profile');},child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:AssetImage('assets/images/girll.png'),

                      ),
                    ),
                  ),
                  Positioned(left: 70,child: InkWell(onTap: (){
                    
                  },child: SvgPicture.asset('assets/images/edit.svg'))),
                ],
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
              child: TextFormField(
                keyboardType: TextInputType.name,
                textAlign: TextAlign.start,
                cursorColor:Colors.black,
                cursorRadius: const Radius.circular(2),
                decoration: InputDecoration(
                  enabledBorder:myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Enter Subject',
                  labelStyle:const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.edit_note,color:Colors.black,),
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
