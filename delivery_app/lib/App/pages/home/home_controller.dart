import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/App/pages/home/home_state.dart';
import 'package:dw9_delivery_app/App/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState>{
  HomeController(this._repository): super(const HomeState.initial());
  
  final ProductRepository _repository;

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final product = await _repository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: product));
    } catch (e,s) {
      log(404);
      emit(state.copyWith(status: HomeStateStatus.error, errorMessage: "Erro ao buscar produtos"));
    }
  }
}