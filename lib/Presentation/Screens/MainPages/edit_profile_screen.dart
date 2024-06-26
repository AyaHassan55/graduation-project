import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import '../../config/routes.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? file;
  String userName = '', email = '', phone = '', subject = '';
  String? profilePicture;
  bool isLoading = false;

  getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      setState(() {});
    }
  }
  Future<void> updateProfile() async {
    setState(() {
      isLoading = true;
    });

    final authCubit = BlocProvider.of<AuthCubit>(context);

    if (file != null) {
      await authCubit.uploadImage(file!);
    }
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'name': userName,
        'email': email,
        'phone': phone,
        'subject name': subject,
      });

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: 'Profile updated successfully',backgroundColor: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 20),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            router.pop();
            router.go('/profile');
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching data'));
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('No data available'));
                  }

                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  String profilePic = userData['profilePicture'] ?? '';
                  userName = userData['name'] ?? '';
                  email = userData['email'] ?? '';
                  phone = userData['phone'] ?? '';
                  subject = userData['subject name'] ?? '';

                  return Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: file != null
                                ? FileImage(file!)
                                : (profilePic.isNotEmpty
                                ? NetworkImage(profilePic)
                                : const AssetImage('assets/images/profile-user_64572.png')) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        child: InkWell(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/edit.svg',
                            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                initialValue: userName,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                cursorRadius: const Radius.circular(2),
                onChanged: (value) {
                  userName = value;
                },
                decoration: InputDecoration(
                  enabledBorder: myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.person_2_outlined, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                initialValue: email,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                cursorRadius: const Radius.circular(2),
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  enabledBorder: myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                initialValue: phone,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                cursorRadius: const Radius.circular(2),
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                  enabledBorder: myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Phone',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.local_phone_rounded, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                initialValue: subject,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                cursorRadius: const Radius.circular(2),
                onChanged: (value) {
                  subject = value;
                },
                decoration: InputDecoration(
                  enabledBorder: myInputBorder(),
                  focusedBorder: myInputBorder(),
                  labelText: 'Subject',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.edit_note, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : updateProfile,
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () async {
                      await getImage(ImageSource.camera);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                  const Text('Camera'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library),
                    onPressed: () async {
                      await getImage(ImageSource.gallery);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                  const Text('Gallery'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
