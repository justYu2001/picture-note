import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:picture_note/configs/firebase_options.dart';
import 'package:picture_note/screens/main_screen.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/firebase_authentication_servise.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthenticationServise>(
          create: (_) => FirebaseAuthenticationServise(),
        ),
        StreamProvider(
            create: (context) =>
                context.read<FirebaseAuthenticationServise>().authState,
            initialData: null),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
