// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/App/model/product_model.dart';

import '../../Core/exceptions/repository_exception.dart';
import '../../Core/rest_client/custom_dio.dart';
import 'products_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio dio;
  ProductRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final results = await dio.unauth().get('/products');
      return results.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao cadastrar produtos', error: e, stackTrace: s);
      throw RepostoryException(message: "Erro ao buscar produto");
    }
  }
}
