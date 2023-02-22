import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoubleVApp extends StatelessWidget {
  const DoubleVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterPersonController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DoubleV App',
        initialRoute: 'welcome',
        routes: {
          'welcome': (_) => const WelcomeScreen(),
        },
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
