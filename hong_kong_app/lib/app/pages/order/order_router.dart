import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/pages/order/order_controller.dart';
import 'package:hong_kong_app/app/pages/order/order_page.dart';
import 'package:provider/provider.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => OrderController())
        ],
        child: const OrderPage(),
      );
}
