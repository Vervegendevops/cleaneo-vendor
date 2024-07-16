import 'package:bloc/bloc.dart';
import 'package:cleaneo_vendor/model/order_data.dart';
import 'package:cleaneo_vendor/services/api_provider.dart';

import 'orders_event.dart';
import 'orders_state.dart';


class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState()) {
    on<GetOrderEvent>(getOrderEvent);
    on<GetPreviousOrderEvent>(getPreviousOrderEvent);
  }

  Future<void> getOrderEvent(GetOrderEvent event, Emitter<OrdersState>emit) async {
    emit(state.copyWith(orderStatus: OrderStatus.loading));
    List<Order> orderlist=await ApiProvider().getOrder();
    if(orderlist.isNotEmpty){
      emit(state.copyWith(orderStatus: OrderStatus.loaded,orderlist: orderlist));

    }
    else{
      emit(state.copyWith(orderStatus: OrderStatus.initial));

    }

  }
  Future<void> getPreviousOrderEvent(GetPreviousOrderEvent event, Emitter<OrdersState>emit) async {
    emit(state.copyWith(orderStatus: OrderStatus.loading));
    List<Order> orderlist=await ApiProvider().getDeliveredOrder();
    if(orderlist.isNotEmpty){
      emit(state.copyWith(orderStatus: OrderStatus.loaded,filterOrderlist: orderlist));

    }
    else{
      emit(state.copyWith(orderStatus: OrderStatus.initial));

    }

  }

}
