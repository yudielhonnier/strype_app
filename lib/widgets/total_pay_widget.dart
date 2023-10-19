import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:strype_app/bloc/pay/pay_bloc.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  final width=MediaQuery.of(context).size.width;
    
    return Container(
      width: width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text('250 USD')
          ],
        ),
        _BtnPay(),
      ] ),
    );
    
  }
}


class _BtnPay extends StatelessWidget {
  const _BtnPay({ Key? key }) : super(key: key);

@override
Widget build(BuildContext context) {
 var blocPay=Provider.of<PayBloc>(context);

    return BlocBuilder<PayBloc,PayState>(
    builder: (_,__){
       var pay=blocPay.state.cardActive;
      return pay!
  ? buildCardButton(context)
  : buildAppleAndGooglePay(context);

    });

  
}


  Widget buildCardButton(BuildContext context) {

     bool  isAndoid=TargetPlatform.android==  Theme.of(context).platform;
    return MaterialButton(
      height: 45,
      minWidth:150 ,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Icon(FontAwesomeIcons.solidCreditCard,color: Colors.white,), 
       SizedBox(width: 10,),
        Text('Pay',style: TextStyle(color: Colors.white,fontSize:20,)),
      ] ,),
      onPressed: (){});}

  Widget buildAppleAndGooglePay(BuildContext context) {

     bool  isAndoid=TargetPlatform.android==  Theme.of(context).platform;
    return MaterialButton(
      height: 45,
      minWidth:150 ,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
       Icon(
            isAndoid
        ?FontAwesomeIcons.google
        :FontAwesomeIcons.apple,
        color: Colors.white,),  
       SizedBox(width: 10,),
        Text('Pay',style: TextStyle(color: Colors.white,fontSize:22,)),
      ],),
      onPressed: (){});
  }
}