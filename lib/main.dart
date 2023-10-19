import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strype_app/pages/home_page.dart';
import 'package:strype_app/pages/payment_completed_page.dart';

import 'bloc/pay/pay_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=>PayBloc()),
          ],
          child: MaterialApp(
                  title: 'Strype App',
                  routes: {
                    'home': (_) => HomePage(),
                    'payment': (_) => PaymentCompletedPage(),
                  },
                  initialRoute: 'home',
                  theme: ThemeData.light().copyWith(
                      primaryColor: Color(0xff284879),
                      scaffoldBackgroundColor: Color(0xff21232A)),
                ),
    );
  }
}




// main.dart
// import 'package:flutter_stripe/flutter_stripe.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // set the publishable key for Stripe - this is mandatory
//   Stripe.publishableKey = 'pk_test_51KnP88KupYcXD2mdXfh5x1Nvt4G6spJdmrnDBbkwd8gRAceTl07yBiQ0vYp2gGjY5RNHPPnWxZrcL0EPpwv0Br8K00O8UIDDdW';
//   runApp(PaymentScreen());
// }

// // payment_screen.dart
// class PaymentScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             CardField(
//               onCardChanged: (card) {
//                 print(card);
//               },
//             ),
//             TextButton(
//               onPressed: () async {
//                 // create payment method
//                 final paymentMethod =
//                     await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
//               },
//               child: Text('pay'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }