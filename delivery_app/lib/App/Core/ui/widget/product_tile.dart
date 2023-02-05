// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/App/Core/extentions/formater.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/colors_app.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/App/model/product_model.dart';
import 'package:dw9_delivery_app/App/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDTO? orderProduct;
  const ProductTile({
    Key? key,
    required this.product,
    this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.of(context).pushNamed(
            '/productDetail',
            arguments: {'product': product, 'order': orderProduct});
        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDTO);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(product.name,
                        style: context.textStyle.textExtraBold
                            .copyWith(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(product.description,
                        style:
                            context.textStyle.textLight.copyWith(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(product.price.currencyPTBR,
                        style: context.textStyle.textExtraBold.copyWith(
                            fontSize: 11, color: context.colors.secondary)),
                  )
                ],
              ),
            ),
            FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: product.image,
                width: 100,
                fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}
