

import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService{

StripeService._privateConstructor();
static final StripeService _instance =StripeService._privateConstructor();
factory StripeService()=>_instance;

String _paymenApiUrl='https://api.stripe.com/v1/payment_intents';
String _secretKey='sk_test_51KnP88KupYcXD2mdJCtEjxE7il1it0cf1UhfURwVpaQ1dFbOEbYJNN4ChJehiGoiqOFoRg7hhPsIpwah7WG1tgl3005E1wCVZs';

void init(){

}

Future payWithExistCard({
  required String amount,
  required String currency,
  required CardField card,

})async{

}
Future payWithNewCard()async{

}
Future payWithGooglePayCard()async{

}
Future _createPaymentIntent()async{

}
Future _makePayment()async{

}




}