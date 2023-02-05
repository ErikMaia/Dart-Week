// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/App/model/product_model.dart';

class OrderProductDTO {
  final int amount;
  final ProductModel product;
  OrderProductDTO({
    required this.amount,
    required this.product,
  });
  double get totalPrice => amount * product.price;
}
