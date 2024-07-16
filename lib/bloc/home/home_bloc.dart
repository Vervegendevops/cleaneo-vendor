import 'package:bloc/bloc.dart';
import 'package:cleaneo_vendor/model/cash_collection.dart';
import 'package:cleaneo_vendor/services/api_provider.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
      on<GetEarningsEvent>(getEarningEvents);
  }

  Future<void> getEarningEvents(GetEarningsEvent event,Emitter<HomeState> emit) async {
    emit(state.copyWith(earningStatus: EarningStatus.loading));
    CashCollectionResponsse? cashCollection=await ApiProvider().getEarnings();
    if(cashCollection!=null){
      emit(state.copyWith(earningStatus: EarningStatus.loaded,cashCollectionResponsse: cashCollection));

    }
    else{
      emit(state.copyWith(earningStatus: EarningStatus.initial));

    }
  }
}
