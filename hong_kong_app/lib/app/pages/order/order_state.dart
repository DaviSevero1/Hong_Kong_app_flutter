// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:hong_kong_app/app/dto/order_product_dto.dart';

part 'widgets/order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  OrderState({
    required this.status,
    required this.orderProducts,
  });
  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [status, orderProducts];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
