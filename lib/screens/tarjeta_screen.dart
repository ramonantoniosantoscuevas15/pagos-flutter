import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class TarjetaScreen extends StatelessWidget {
  const TarjetaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tarjeta = TarjetaCredito(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Fernando Herrera');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagar'),
        ),
        body: Stack(
          children:  [
            Container(),
            Hero(
              tag: tarjeta.cardNumber,
              child: CreditCardWidget(
                  cardNumber: tarjeta.cardNumber,
                  expiryDate: tarjeta.expiracyDate,
                  cardHolderName: tarjeta.cardHolderName,
                  cvvCode: tarjeta.cvv,
                  showBackView: false,
                  // ignore: non_constant_identifier_names
                  onCreditCardWidgetChange: (CreditCardBrand) {}),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
