import 'package:dw9_delivery_app/App/Core/ui/Style/colors_app.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecremant extends StatelessWidget {
  const DeliveryIncrementDecremant({super.key, required this.increment, required this.decrement, required this.amont});
  final VoidCallback increment;
  final VoidCallback decrement;
  final int amont;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          InkWell(
            onTap: decrement,
            child: Text('-',
                style: context.textStyle.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey)),
          ),
          Text(amont.toString(),
              style: context.textStyle.textMedium
                  .copyWith(fontSize: 17, color: context.colors.secondary)),
          InkWell(
            onTap: increment,
            child: Text('+',
                style: context.textStyle.textMedium
                    .copyWith(fontSize: 22, color: context.colors.primary)),
          ),
        ]),
      ),
    );
  }
}
