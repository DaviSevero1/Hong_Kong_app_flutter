// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_kong_app/app/core/exeptions/repository_exceptions.dart';
import 'package:hong_kong_app/app/core/rest_client/custom_dio.dart';
import 'package:hong_kong_app/app/dto/order_dto.dart';
import 'package:hong_kong_app/app/models/payment_type_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;
  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<void> saveOrder(OrderDto order) async {
    try {
      await dio.auth().post('/orders', data: {
        'products': order.products
            .map((p) => {
                  'id': p.product.id,
                  'amount': p.amout,
                  'total_price': p.totalPrice,
                })
            .toList(),
        'user_id': '#userAuthRef',
        'address': order.address,
        'CPF': order.document,
        'payment_method_id': order.paymentMethodId,
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar pedido', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao registrar pedido');
    }
  }
}
