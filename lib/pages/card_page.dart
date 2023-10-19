import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strype_app/bloc/pay/pay_bloc.dart';
import 'package:strype_app/models/custom_credit_card.dart';
import 'package:strype_app/widgets/total_pay_widget.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:provider/provider.dart';


class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       var payBloc=Provider.of<PayBloc>(context);

    return BlocBuilder<PayBloc,PayState>(
      builder:(_,__){
        var card=payBloc.state.card!;
 return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            payBloc.add(OnDesactiveCard());
            Navigator.pop(context);
          },),
       
        title: Text('Pay'),
        
      ),
    
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: card.cardNumber!,
            child: CreditCardWidget( 
              cardNumber: card.cardNumber!,
              expiryDate: card.expiracyDate!,
              cardHolderName: card.cardHolderName!,
              cvvCode: card.cvv!,
              showBackView: false,
              onCreditCardWidgetChange: (creditCardBrand) {
              },
            ),
          ),
          Positioned(bottom: 0, child: TotalPayButton())
        ],
      ),
    );
      } );

   
  }
}
