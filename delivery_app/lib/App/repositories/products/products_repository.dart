import 'package:dw9_delivery_app/App/model/product_model.dart';

abstract class ProductRepository{
  Future<List<ProductModel>> findAllProducts();
}