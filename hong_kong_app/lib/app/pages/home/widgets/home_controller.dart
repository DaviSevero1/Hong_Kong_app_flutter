import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hong_kong_app/app/dto/order_product_dto.dart';
import 'package:hong_kong_app/app/pages/home/widgets/home_state.dart';
import 'package:hong_kong_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos'),
      );
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag
        .indexWhere((orderP) => orderProduct.product == orderProduct.product);

    if (orderIndex > -1) {
      if (orderProduct.amout == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
      shoppingBag[orderIndex] = orderProduct;
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }

  void updateBag(List<OrderProductDto> updateBag) {
    emit(state.copyWith(shoppingBag : updateBag));
  }
}
