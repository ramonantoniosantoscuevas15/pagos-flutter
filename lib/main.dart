import 'package:flutter/material.dart';
import 'package:stripe_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stripe App',
      initialRoute: 'home',
      routes: {
        'home':(_) => const HomeScreen(),
        'pago_completo' :(_) =>const PagoCompletoScreen()
      },
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff284879),
        )
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xff21232A)
      )
    );
  }
}