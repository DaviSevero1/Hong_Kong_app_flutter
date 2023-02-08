// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hong_kong_app/app/models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amout;
  OrderProductDto({
    required this.product,
    required this.amout,
  });

  double get totalPrice => amout * product.price;

  OrderProductDto copyWith({
    ProductModel? product,
    int? amout,
  }) {
    return OrderProductDto(
      product: product ?? this.product,
      amout: amout ?? this.amout,
    );
  }
}
