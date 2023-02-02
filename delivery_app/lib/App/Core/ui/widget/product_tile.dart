import 'package:dw9_delivery_app/App/Core/extentions/formater.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/colors_app.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style:
                          context.textStyle.textExtraBold.copyWith(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(product.description,
                      style: context.textStyle.textLight.copyWith(fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(product.price.currencyPTBR,
                      style: context.textStyle.textExtraBold.copyWith(
                          fontSize: 11, color: context.colors!.secondary)),
                )
              ],
            ),
          ),
          FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif', image: product.image, width:100, fit: BoxFit.cover)
        ],
      ),
    );
  }
}
