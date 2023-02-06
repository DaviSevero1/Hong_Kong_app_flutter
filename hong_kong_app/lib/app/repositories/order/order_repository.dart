import 'package:hong_kong_app/app/pages/order/widgets/payment_types_field.dart';

import '../../models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
}
