// To parse this JSON data, do
//
//     final paymentIntentResponse = paymentIntentResponseFromMap(jsonString);

import 'dart:convert';

class PaymentIntentResponse {
    PaymentIntentResponse({
        this.id,
        this.object,
        this.amount,
        this.amountCapturable,
        this.amountDetails,
        this.amountReceived,
        this.application,
        this.applicationFeeAmount,
        this.automaticPaymentMethods,
        this.canceledAt,
        this.cancellationReason,
        this.captureMethod,
        this.clientSecret,
        this.confirmationMethod,
        this.created,
        this.currency,
        this.customer,
        this.description,
        this.invoice,
        this.lastPaymentError,
        this.latestCharge,
        this.livemode,
        this.metadata,
        this.nextAction,
        this.onBehalfOf,
        this.paymentMethod,
        this.paymentMethodOptions,
        this.paymentMethodTypes,
        this.processing,
        this.receiptEmail,
        this.review,
        this.setupFutureUsage,
        this.shipping,
        this.source,
        this.statementDescriptor,
        this.statementDescriptorSuffix,
        this.status,
        this.transferData,
        this.transferGroup,
    });

    final String? id;
    final String? object;
    final int? amount;
    final int? amountCapturable;
    final AmountDetails? amountDetails;
    final int? amountReceived;
    final dynamic application;
    final dynamic applicationFeeAmount;
    final dynamic automaticPaymentMethods;
    final dynamic canceledAt;
    final dynamic cancellationReason;
    final String? captureMethod;
    final String? clientSecret;
    final String? confirmationMethod;
    final int? created;
    final String? currency;
    final dynamic customer;
    final dynamic description;
    final dynamic invoice;
    final dynamic lastPaymentError;
    final dynamic latestCharge;
    final bool? livemode;
    final Metadata? metadata;
    final dynamic nextAction;
    final dynamic onBehalfOf;
    final dynamic paymentMethod;
    final PaymentMethodOptions? paymentMethodOptions;
    final List<String>? paymentMethodTypes;
    final dynamic processing;
    final dynamic receiptEmail;
    final dynamic review;
    final dynamic setupFutureUsage;
    final dynamic shipping;
    final dynamic source;
    final dynamic statementDescriptor;
    final dynamic statementDescriptorSuffix;
    final String? status;
    final dynamic transferData;
    final dynamic transferGroup;

    factory PaymentIntentResponse.fromJson(String str) => PaymentIntentResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PaymentIntentResponse.fromMap(Map<String, dynamic> json) => PaymentIntentResponse(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountDetails: json["amount_details"] == null ? null : AmountDetails.fromMap(json["amount_details"]),
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods: json["automatic_payment_methods"],
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        latestCharge: json["latest_charge"],
        livemode: json["livemode"],
        metadata: json["metadata"] == null ? null : Metadata.fromMap(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions: json["payment_method_options"] == null ? null : PaymentMethodOptions.fromMap(json["payment_method_options"]),
        paymentMethodTypes: json["payment_method_types"] == null ? null : List<String>.from(json["payment_method_types"].map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_capturable": amountCapturable,
        "amount_details": amountDetails,
        "amount_received": amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "automatic_payment_methods": automaticPaymentMethods,
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "latest_charge": latestCharge,
        "livemode": livemode,
        "metadata": metadata,
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_options": paymentMethodOptions == null ? null : paymentMethodOptions!.toMap(),
        "payment_method_types": paymentMethodTypes == null ? null : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
    };
}

class AmountDetails {
    AmountDetails({
        required this.tip,
    });

    final Metadata tip;

    factory AmountDetails.fromJson(String str) => AmountDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AmountDetails.fromMap(Map<String, dynamic> json) => AmountDetails(
        tip: json["tip"],
    );

    Map<String, dynamic> toMap() => {
        "tip": tip,
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toMap() => {
    };
}

class PaymentMethodOptions {
    PaymentMethodOptions({
        required this.card,
    });

    final Card card;

    factory PaymentMethodOptions.fromJson(String str) => PaymentMethodOptions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PaymentMethodOptions.fromMap(Map<String, dynamic> json) => PaymentMethodOptions(
        card: json["card"] ,
    );

    Map<String, dynamic> toMap() => {
        "card": card,
    };
}

class Card {
    Card({
        this.installments,
        this.mandateOptions,
        this.network,
        this.requestThreeDSecure,
    });

    final dynamic installments;
    final dynamic mandateOptions;
    final dynamic network;
    final String? requestThreeDSecure;

    factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        installments: json["installments"],
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"],
    );

    Map<String, dynamic> toMap() => {
        "installments": installments,
        "mandate_options": mandateOptions,
        "network": network,
        "request_three_d_secure": requestThreeDSecure,
    };
}
