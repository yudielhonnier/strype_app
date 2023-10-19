part of 'pay_bloc.dart';

@immutable
 class PayState {
  final double? amountPayable;
  final String? coin; 
  final bool? cardActive;
   final CustomCreditCard? card;

  PayState({
    this.amountPayable=300, 
    this.coin='USD', 
    this.cardActive=false, 
    this.card
    });

  PayState copyWith({
       double? amountPayable,
   String? coin,
   bool? cardActive,
    CustomCreditCard? card
  })=>PayState(
      amountPayable:amountPayable??this.amountPayable,
   coin:coin??this.coin,
   cardActive:cardActive??this.cardActive,
   card:card??this.card
   );


}

    // CustomCreditCard initialized
    // :
    // this.card= CustomCreditCard(
    //     cardNumberHidden: '4242',
    //     cardNumber: '4242424242424242',
    //     brand: 'visa',
    //     cvv: '213',
    //     expiracyDate: '01/25',
    //     cardHolderName: 'Fernando Herrera');



