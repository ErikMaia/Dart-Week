import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../model/product_model.dart';

// part 'home_state.g.dart';

// @match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null;

  const HomeState(this.status, this.products, this.errorMessage);

  @override
  List<Object?> get props => throw UnimplementedError();

  HomeState copyWith({HomeStateStatus? status, List<ProductModel>? products, String? errorMessage}) {
    return HomeState(status ?? this.status, products ?? this.products, errorMessage?? this.errorMessage);
  }
}
