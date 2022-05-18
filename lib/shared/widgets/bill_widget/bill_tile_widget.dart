import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BillTileWidget extends StatelessWidget {
  final BillModel data;
  const BillTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: AppTextStyle.titleListTile,
        ),
        subtitle: Text(
          "Vence em: ${data.dueDate}",
          style: AppTextStyle.captionBody,
        ),
        trailing: Text.rich(TextSpan(
            text: "R\$ ",
            style: AppTextStyle.trailingRegular,
            children: [
              TextSpan(
                text: "${data.value!.toStringAsFixed(2)}",
                style: AppTextStyle.trailingBold,
              )
            ])),
      ),
    );
  }
}
