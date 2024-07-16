 import 'package:equatable/equatable.dart';

import '../model/order_data.dart';

enum OrderStatus{
  initial,
  loading,
  loaded
 }
 enum PreviousOrderStatus{
  initial,
   loading,
   loaded
 }

class OrdersState extends Equatable {
  OrderStatus orderStatus;
  List<Order> orderlist;
  List<Order> filterOrderlist;


  OrdersState({
    this.orderStatus=OrderStatus.initial,
    this.orderlist=const[],
    this.filterOrderlist=const[],

});

  OrdersState copyWith({
    OrderStatus? orderStatus,
    List<Order>? orderlist,
    List<Order>? filterOrderlist


  }){
    return OrdersState(
      orderStatus: orderStatus??this.orderStatus,
      orderlist: orderlist??this.orderlist,
      filterOrderlist: filterOrderlist??this.filterOrderlist
    );
  }


  @override
  List<Object?> get props => [orderStatus,orderlist,filterOrderlist];
}

