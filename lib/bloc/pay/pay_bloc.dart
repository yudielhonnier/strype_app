import 'package:bloc/bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:meta/meta.dart';
import 'package:strype_app/models/custom_credit_card.dart';

part 'pay_event.dart';
part 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(PayState()) {
    on<PayEvent>((event, emit) { 
      // TODO: implement event handler
      if(event is OnSelectCard){
        emit(state.copyWith(cardActive: true,card: event.card));
      }else if(event is OnDesactiveCard){
        emit(state.copyWith(cardActive: false));
      }
    });
  }
}
