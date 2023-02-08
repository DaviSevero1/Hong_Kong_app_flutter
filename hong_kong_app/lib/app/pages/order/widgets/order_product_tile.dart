// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/extensions/formater_extensions.dart';
import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_increment_button.dart';

import 'package:hong_kong_app/app/dto/order_product_dto.dart';
import 'package:hong_kong_app/app/pages/order/order_controller.dart';
import 'package:provider/provider.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    Key? key,
    required this.index,
    required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (orderProduct.amout * product.price).currencyPTBR,
                        style: context.textStyles.textMedium.copyWith(
                            fontSize: 14, color: context.colors.secondary),
                      ),
                      EcommerceIncrementButton.compact(
                          amout: orderProduct.amout,
                          incrementTap: () {
                            context
                                .read<OrderController>()
                                .incrementProduct(index);
                          },
                          decrementTap: () {
                            context
                                .read<OrderController>()
                                .decrementProduct(index);
                          })
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
