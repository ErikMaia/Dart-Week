import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/App/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/App/pages/home/home_state.dart';
import 'package:dw9_delivery_app/App/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repository) : super(const HomeState.initial());

  final ProductRepository _repository;

  Future<void> loadProducts() async {
    emit(state.copyWith(
        status: HomeStateStatus.loading, shoppingBag: state.shoppingBag));
    try {
      final product = await _repository.findAllProducts();
      emit(state.copyWith(
          status: HomeStateStatus.loaded,
          products: product,
          shoppingBag: state.shoppingBag));
    } catch (e) {
      log(404);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro ao buscar produtos",
          shoppingBag: state.shoppingBag));
    }
  }

  void addOrUpdateBag(OrderProductDTO orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex =
        shoppingBag.indexWhere((orderP) => orderP.product == orderP.product);
    if (orderIndex != -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }
    shoppingBag.add(orderProduct);
    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
