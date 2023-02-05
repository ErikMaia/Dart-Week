import 'package:bloc/bloc.dart';

class ProductDetailControler extends Cubit<int> {
  late final bool _hasOrder;

  ProductDetailControler() : super(1);

  void initialize(int amount, bool hasOrder) {
    _hasOrder = hasOrder;
    emit(amount);
  }

  void increment() => emit(state + 1);
  void decrement() =>
      state > (_hasOrder ? 0 : 1) ? emit(state - 1) : emit(state);
}
