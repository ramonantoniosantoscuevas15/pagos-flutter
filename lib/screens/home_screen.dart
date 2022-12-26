import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/screens/screens.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final stripeService = StripeService();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pagarBloc = context.read<PagarBloc>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagar'),
          actions: [
            IconButton(
                onPressed: () async {
                  final amount = pagarBloc.state.montoPagarString;
                  final currency = pagarBloc.state.moneda;
                  final resp = await stripeService.pagarConNuevatarjeta(
                      amount: amount, currency: currency);
                  if (resp.ok) {
                    // ignore: use_build_context_synchronously
                    mostrarAlerta(context, 'Tarjeta ok', 'Todo Correcto');
                  } else {
                     // ignore: use_build_context_synchronously
                    mostrarAlerta(context, 'Algo salio mal', resp.msg!);
                  }
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: const BouncingScrollPhysics(),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<PagarBloc>()
                            .add(OnSeleccionarTarjeta(tarjeta));
                        Navigator.push(context,
                            navegarFadeIn(context, const TarjetaScreen()));
                      },
                      child: Hero(
                        tag: tarjeta.cardNumber,
                        child: CreditCardWidget(
                          cardNumber: tarjeta.cardNumber,
                          expiryDate: tarjeta.expiracyDate,
                          cardHolderName: tarjeta.cardHolderName,
                          cvvCode: tarjeta.cvv,
                          showBackView: false,
                          // ignore: non_constant_identifier_names
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        ),
                      ),
                    );
                  }),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
