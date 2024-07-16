import 'package:cleaneo_vendor/model/cash_collection.dart';
import 'package:equatable/equatable.dart';


enum EarningStatus{
  initial,
  loading,
  loaded
}
class HomeState extends Equatable {
  EarningStatus earningStatus;
  CashCollectionResponsse cashCollectionResponsse;
  HomeState({
    this.earningStatus=EarningStatus.initial,
    this.cashCollectionResponsse=const CashCollectionResponsse()
});

  HomeState copyWith({
    EarningStatus? earningStatus,
    CashCollectionResponsse? cashCollectionResponsse

  }){
    return HomeState(
      earningStatus: earningStatus??this.earningStatus,
      cashCollectionResponsse: cashCollectionResponsse??this.cashCollectionResponsse
    );
  }

  @override
  List<Object?> get props => [earningStatus,cashCollectionResponsse];
}

