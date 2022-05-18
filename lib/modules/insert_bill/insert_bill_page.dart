import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_bill/insert_bill_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/label_button/double_label_buttons.dart';

class InsertBillPage extends StatefulWidget {
  final String? barcode;

  const InsertBillPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBillPage> createState() => _InsertBillPageState();
}

class _InsertBillPageState extends State<InsertBillPage> {
  final controller = InsertBillController();
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93),
                child: Text(
                  "Preencha os dados do boleto",
                  style: AppTextStyle.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                      ),
                      InputTextWidget(
                        label: "Vencimento",
                        icon: FontAwesomeIcons.circleXmark,
                        controller: dueDateInputTextController,
                        validator: controller.validadeDue,
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                      ),
                      InputTextWidget(
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        controller: moneyInputTextController,
                        validator: (_) => controller.validateValue(
                            moneyInputTextController.numberValue.toString()),
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                      ),
                      InputTextWidget(
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        controller: barcodeInputTextController,
                        validator: controller.validateBarcode,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: DoubleLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
          setState(() {});
        },
        secondaryLabel: "Cadastrar",
        enableSecondaryColor: true,
        secondaryOnPressed: () async {
          await controller.billRegister();
          Navigator.pop(context);
          setState(() {});
        },
      ),
    );
  }
}
