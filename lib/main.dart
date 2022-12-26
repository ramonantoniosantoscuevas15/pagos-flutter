import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/screens/screens.dart';

import 'services/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Inicializa el StripeService
     StripeService()
    .init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PagarBloc(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stripe App',
          initialRoute: 'home',
          routes: {
            'home': (_) =>  HomeScreen(),
            'pago_completo': (_) => const PagoCompletoScreen()
          },
          theme: ThemeData(
              colorScheme: const ColorScheme.light(
            primary: Color(0xff284879),
          )).copyWith(scaffoldBackgroundColor: const Color(0xff21232A))),
    );
  }
}
