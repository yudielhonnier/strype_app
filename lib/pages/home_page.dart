import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:strype_app/bloc/pay/pay_bloc.dart';
import 'package:strype_app/data/custom_cards.dart';
import 'package:strype_app/helpers/helpers.dart';
import 'package:strype_app/pages/card_page.dart';
import 'package:strype_app/widgets/total_pay_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final size=MediaQuery.of(context).size;
    var payBloc=Provider.of<PayBloc>(context);

    return Scaffold(
     appBar: AppBar(
       title: Text('Pay'),
       actions: [
      IconButton(
           icon:Icon(Icons.add),
           onPressed: () async{

            //  showLoading(context);
            //  await Future.delayed(Duration(seconds: 1));
            // Navigator.pop(context);
              showAlert(context, 'Hello', 'World');
           }),
       ],
     ),
     body:Stack(
       children: [

       Positioned(
         height: size.height,
         width: size.width,
         top: 200,
         child: PageView.builder(
           controller: PageController(
             viewportFraction: 0.9
           ),
           physics: BouncingScrollPhysics(),
           itemCount: customCards.length,
           itemBuilder: (_,i){
       
               final card=customCards[i];
       
             return GestureDetector(
               onTap: (){
                 payBloc.add(OnSelectCard(card));
                 Navigator.push(context,navigateFadeIn(context, CardPage())  ); 
               },
               child: Hero(
                 tag: card.cardNumber!,
                 child: CreditCardWidget(
                   cardNumber: card.cardNumber!,
                   expiryDate: card.expiracyDate!, 
                   cardHolderName: card.cardHolderName!, 
                   cvvCode: card.cvv!, 
                   showBackView:false, 
                     onCreditCardWidgetChange: (creditCardBrand) {print(creditCardBrand);},
                   ),
               ),
             );
           }),
       )     ,
       Positioned(
         bottom: 0,
         child: TotalPayButton())
       ],)
   );
  }
} 