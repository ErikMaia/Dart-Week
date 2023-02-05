import 'package:auto_size_text/auto_size_text.dart';
import 'package:dw9_delivery_app/App/Core/extentions/formater.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/Core/ui/helper/size_extentions.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_appbar.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_increment_decrement_button.dart';
import 'package:dw9_delivery_app/App/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/App/model/product_model.dart';
import 'package:dw9_delivery_app/App/pages/product_detail/product_datail_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final OrderProductDTO? order;
  const ProductDetailPage({super.key, required this.product, this.order});

  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailControler> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initialize(amount, widget.order != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: context.screenWidth,
          height: context.percentHeight(.4),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.product.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.product.name,
            style: context.textStyle.textExtraBold.copyWith(fontSize: 22),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Text(
                widget.product.description,
              ),
            ),
          ),
        ),
        const Divider(),
        Row(
          children: [
            SizedBox(
                width: context.percentWidth(.45),
                height: 68,
                child: DeliveryIncrementDecremant(
                    amont: 1, decrement: () {}, increment: () {})),
            SizedBox(
                width: context.percentHeight(.45),
                height: 68,
                child: BlocBuilder<ProductDetailControler, int>(
                  builder: (context, amount) => ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showConfirmDelete(amount);
                        } else {
                          Navigator.of(context).pop(OrderProductDTO(
                              amount: amount, product: widget.product));
                        }
                      },
                      child: BlocBuilder<ProductDetailControler, int>(
                          builder: (context, amount) {
                        return Visibility(
                          visible: amount > 0,
                          replacement: Text(
                            "Excluir Produto",
                            style: context.textStyle.textExtraBold,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DeliveryIncrementDecremant(
                                increment: () {
                                  controller.increment();
                                },
                                decrement: () {
                                  controller.decrement();
                                },
                                amont: amount,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  (widget.product.price * amount).currencyPTBR,
                                  style: context.textStyle.textExtraBold,
                                  maxFontSize: 13,
                                  minFontSize: 5,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                ))
          ],
        )
      ]),
    );
  }

  void _showConfirmDelete(int amount) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja Excluir o produto?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancelar',
                    style:
                        context.textStyle.textBold.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(OrderProductDTO(
                        amount: 0, product: widget.product));
                  },
                  child: Text(
                    'Confirmar',
                    style: context.textStyle.textBold,
                  )),
            ],
          );
        });
  }
}
