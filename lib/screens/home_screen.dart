import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/screens/screens.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagar'),
          actions: [
            IconButton(
                onPressed: () async {
                  //mostrarLoading(context);
                  //await Future.delayed(const Duration(seconds: 1));
                  // ignore: use_build_context_synchronously
                  //Navigator.pop(context);
                  mostrarAlerta(context, 'Realizar Pago', 'Pago Realizado');
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
