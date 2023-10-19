import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PaymentCompletedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment completed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.star,color: Colors.white54,size: 100,  ),
            SizedBox(height: 20,),
            Text('The payment has been completed',style: TextStyle(color: Colors.white),)
          ],
        ),
     ),
   );
  }
}