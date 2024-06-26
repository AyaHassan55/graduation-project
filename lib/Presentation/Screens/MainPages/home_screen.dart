//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:grady/Presentation/Screens/MainPages/camera_screen.dart';
// import 'package:grady/Presentation/Screens/MainPages/courses_Screen.dart';
// import 'package:grady/Presentation/Screens/MainPages/leaderboard_screen.dart';
// import 'package:grady/Presentation/Screens/MainPages/notification_screen.dart';
// import 'package:grady/Presentation/Screens/MainPages/profile_screen.dart';
// import 'package:grady/Presentation/Widgets/home_body_widget.dart';
// import 'package:grady/Presentation/Widgets/today_leader_board.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   bool on = false;
//
//   final List<Widget> _screens = [
//     const HomeScreen(),
//      const LeaderBoardScreen(),
//     const CourseScreen(),
//     const ProfileScreen(),
//     CameraScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _currentIndex == 0
//           ? Padding(
//         padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
//         child: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return const Center(child: Text('Error fetching data'));
//             }
//
//             if (!snapshot.hasData || !snapshot.data!.exists) {
//               return const Center(child: Text('No data available'));
//             }
//
//             var userData = snapshot.data!.data() as Map<String, dynamic>;
//             String profilePic = userData['profilePicture'] ?? '';
//             String userName = userData['name'] ?? '';
//
//             return ListView(
//               children: [
//                 ListTile(
//                   leading: Container(
//                     width: 50,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: profilePic.isNotEmpty
//                             ? NetworkImage(profilePic)
//                             : const AssetImage('assets/images/account.png') as ImageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     'Hi, $userName  ',
//                     style: const TextStyle(
//                       fontFamily: 'Poppins',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: const Text(
//                     'How are you doing today?',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       color: Colors.black,
//                       fontSize: 13,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   trailing: InkWell(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const NotificationScreen()),
//                     ),
//                     child: SvgPicture.asset('assets/images/bell.svg'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(right: 90.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Today',
//                               style: TextStyle(fontFamily: 'Poppins'),
//                             ),
//                             Text(
//                               '    Now',
//                               style: TextStyle(fontFamily: 'Poppins'),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 68.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               DateFormat('EEEE d MMM').format(DateTime.now()),
//                               style: const TextStyle(
//                                   fontFamily: 'Poppins', fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               DateFormat('hh:mm a').format(DateTime.now()),
//                               style: const TextStyle(
//                                   fontFamily: 'Poppins',
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const HomeBodyWidget(),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Today's Leaderboard",
//                     style: TextStyle(
//                         fontFamily: 'Poppins', fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                  const Padding(
//                   padding:EdgeInsets.all(18.0),
//                   child: Row(
//                     children: [
//                       ThirdPlaceLeaderBoard(),
//                       FirstPlaceLeaderBoard(),
//                       SecondPlaceLeaderBoard(),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       )
//           : _screens[_currentIndex],
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(25)),
//           child: SalomonBottomBar(
//             backgroundColor: Colors.black,
//             selectedColorOpacity: 0.99,
//             currentIndex: _currentIndex,
//             onTap: (i) => setState(() {
//               _currentIndex = i;
//               on = !on;
//             }),
//             items: [
//               SalomonBottomBarItem(
//                 icon: SvgPicture.asset(
//                   'assets/icons/home.svg',
//                   colorFilter: _currentIndex == 0
//                       ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
//                       : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                   height: 20,
//                 ),
//                 title: const Text(
//                   "Home",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 selectedColor: Colors.white,
//               ),
//               SalomonBottomBarItem(
//                 icon: SvgPicture.asset(
//                   'assets/icons/leaderboard.svg',
//                   colorFilter: _currentIndex == 1
//                       ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
//                       : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                   height: 20,
//                 ),
//                 title: const Text(
//                   "LeaderBoard",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 selectedColor: Colors.white,
//               ),
//               SalomonBottomBarItem(
//                 icon: SvgPicture.asset(
//                   'assets/icons/courses.svg',
//                   colorFilter: _currentIndex == 2
//                       ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
//                       : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                   height: 20,
//                 ),
//                 title: const Text(
//                   "Courses",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 selectedColor: Colors.white,
//               ),
//               SalomonBottomBarItem(
//                 icon: SvgPicture.asset(
//                   'assets/icons/icon_profile.svg',
//                   colorFilter: _currentIndex == 3
//                       ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
//                       : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                   height: 20,
//                 ),
//                 title: const Text(
//                   "Profile",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 selectedColor: Colors.white,
//               ),
//               SalomonBottomBarItem(
//                 icon: SvgPicture.asset(
//                   'assets/icons/camera.svg',
//                   colorFilter: _currentIndex == 4
//                       ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
//                       : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                   height: 20,
//                 ),
//                 title: const Text(
//                   "Camera",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 selectedColor: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class User {
//   final String name;
//   final double percentage;
//   final String imagePath;
//
//   User({required this.name, required this.percentage, required this.imagePath});
//
//   factory User.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map<String, dynamic>;
//     return User(
//       name: data['name'] ?? '',
//       percentage: (data['percentage'] ?? 0).toDouble() / 100,
//       imagePath: data['imagePath'] ?? '',
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../Widgets/home_body_widget.dart';
import '../../Widgets/today_leader_board.dart';
import 'camera_screen.dart';
import 'courses_Screen.dart';
import 'leaderboard_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class User {
  final String name;
  final double percentage;
  final String imagePath;

  User({required this.name, required this.percentage, required this.imagePath});

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      name: data['name'] ?? '',
      percentage: (data['Percentage'] ?? 0).toDouble() / 100,
      imagePath: data['profilePicture'] ?? '',
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool on = false;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LeaderBoardScreen(),
    const CourseScreen(),
    const ProfileScreen(),
    CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (userSnapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            }
            if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
              return const Center(child: Text('No data available'));
            }

            var userData = User.fromFirestore(userSnapshot.data!);
            String profilePic = userData.imagePath;
            String userName = userData.name;

            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .orderBy('Percentage', descending: true)
                  .limit(3)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data available'));
                }

                List<User> users = snapshot.data!.docs
                    .map((doc) => User.fromFirestore(doc))
                    .toList();

                return ListView(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 50,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: profilePic.isNotEmpty
                                ? NetworkImage(profilePic)
                                : const AssetImage('assets/images/account.png') as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        'Hi, $userName  ',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'How are you doing today?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationScreen()),
                        ),
                        child: SvgPicture.asset('assets/images/bell.svg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 90.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Today',
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                                Text(
                                  '    Now',
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 68.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('EEEE d MMM').format(DateTime.now()),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('hh:mm a').format(DateTime.now()),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const HomeBodyWidget(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Today's Leaderboard",
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ThirdPlaceLeaderBoard(user: users.length > 2 ? users[2] : User(name: '', percentage: 0.0, imagePath: '')),
                          FirstPlaceLeaderBoard(user: users.isNotEmpty ? users[0] : User(name: '', percentage: 0.0, imagePath: '')),
                          SecondPlaceLeaderBoard(user: users.length > 1 ? users[1] : User(name: '', percentage: 0.0, imagePath: '')),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      )
          : _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius:const BorderRadius.all(Radius.circular(25)),
          child: SalomonBottomBar(
            // margin:const EdgeInsets.all(7),
            backgroundColor: Colors.black,
            selectedColorOpacity: 0.99,
            currentIndex: _currentIndex,
            onTap: (i) => setState(()  {_currentIndex = i; on=!on;}),
            items: [
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/home.svg',colorFilter: _currentIndex==0 ? const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn),height: 20), title:const Text("Home",style: TextStyle(color: Colors.black),), selectedColor: Colors.white),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/leaderboard.svg',colorFilter: _currentIndex==1 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn) , height: 20), title:const Text("LeaderBoard",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/courses.svg',colorFilter: _currentIndex==2 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Courses",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/icon_profile.svg',colorFilter: _currentIndex==3 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Profile",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/camera.svg',colorFilter: _currentIndex==4 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Camera",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
            ],

          ),
        ),
      ),
    );
  }
}
