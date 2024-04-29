// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/config/routes.dart';

// import 'Presentation/Screens/MainPages/camera_screen.dart';

// List<CameraDescription>cameras=[];
// Future <void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras=await availableCameras();
//   runApp(const MyApp());
// }
void main(){
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
}
