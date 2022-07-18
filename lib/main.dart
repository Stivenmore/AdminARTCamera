import 'package:admin_camera_direct/data/datasource/firebase_datasource.dart';
import 'package:admin_camera_direct/domain/cubit/general_cubit.dart';
import 'package:admin_camera_direct/screens/Principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GeneralCubit(firebaseRepository: FirebaseRepository()),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AdminARTCamera',
          home: Principal()),
    );
  }
}
