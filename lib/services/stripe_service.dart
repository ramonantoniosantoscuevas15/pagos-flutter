import 'package:dio/dio.dart';
import 'package:stripe_app/models/models.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  //singleton
  StripeService._privateConstrotor();
  static final StripeService _intance = StripeService._privateConstrotor();
  factory StripeService() => _intance;
  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static String _secretKey =
      'sk_test_51MJJ0dDzWSzd4c55nLpnkzvPh7Rr1aInUzNjCHfgGgGXPH1cDIkHYGa8mEWnTEdz7jpnNRtNFO9vijVWtDvyy6t600JgZoPoyj';
  String _apiKey =
      'pk_test_51MJJ0dDzWSzd4c550foUaHz2GBAM1wFeXCQkfb9LXIME75hnZkOohJ3jWQ3ZtJfd6uBICESirQQWS2QOCyWuzprs00TmNaDyV9';
  final headerOptions =
      Options(contentType: Headers.formUrlEncodedContentType, headers: {
    'Authorization': 'Bearer ${StripeService._secretKey}',
  });
  void init() {
    StripePayment.setOptions(StripeOptions(
      publishableKey: _apiKey,
      androidPayMode: 'test',
      merchantId: 'test',
    ));
  }

  Future pagarConTarjetaExiste({
    required String amount,
    required String currency,
    required CreditCard card,
  }) async {}
  Future<StripeCustomResponse> pagarConNuevatarjeta({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      //crear el intent
      final resp = await _crearPaymentIntent(amount: amount, currency: currency);
      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future pagarApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {}
  Future<PaymentIntentResponse> _crearPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final data = {
        'amount': amount,
        'currency': currency,
      };
      final resp =
          await dio.post(_paymentApiUrl, data: data, options: headerOptions);
      return PaymentIntentResponse.fromJson(resp.data);
    } catch (e) {
      print('Error en intento: ${e.toString()}');
      return PaymentIntentResponse(status: '400');
    }
  }

  Future _realizarPago({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}
