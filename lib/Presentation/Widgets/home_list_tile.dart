// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:grady/Presentation/Screens/MainPages/notification_screen.dart';
//
// import '../../bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
//
// class HomeListTile extends StatelessWidget {
//   const HomeListTile({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final authCubit = BlocProvider.of<AuthCubit>(context);
//     final fullName = authCubit.fullName ?? 'Doctor';
//     return ListTile (
//       leading:  Container(
//         width: 70,
//         height: 70,
//         decoration:const BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image:AssetImage('assets/images/girll.png'),
//
//           ),
//         ),
//       ),
//       title: Text('Hi $fullName..',style: const TextStyle(fontFamily: 'Poppins',color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
//       subtitle:const Text('How are you doing today ?',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
//       trailing:InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen())) ,child: SvgPicture.asset('assets/images/bell.svg')),
//     );
//   }
// }