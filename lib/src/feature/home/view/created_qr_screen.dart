import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../core/app_textstyles.dart';
import '../../../core/colors.dart';
import '../../../widget/app_text_filed.dart';
import '../notifier/scan_notifier.dart';

String? validateFieldNotEmpty(String? value) =>
    value == null || value.isEmpty ? 'Field cannot be empty' : null;

class CreatedQrScreen extends ConsumerStatefulWidget {
  const CreatedQrScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatedQrScreen> createState() => _CreatedQrScreenState();
}

class _CreatedQrScreenState extends ConsumerState<CreatedQrScreen> {
  static final amountController = TextEditingController();

  String? val;
  onValChange() {
    setState(() {
      val = amountController.text;
    });
  }

  @override
  void dispose() {
    amountController.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(scanScreenNotifier);

    GlobalKey previewContainer = GlobalKey();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(
          style: AppTextStyles.optionStyle.copyWith(),
          children: const [
            TextSpan(text: 'Create', style: TextStyle(color: Colors.black)),
            TextSpan(
              text: 'Qr-Code',
              style: TextStyle(
                  color: AppColors.primary), // Set your desired color here
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  title: "",
                  hintText: "Text here...",
                  validator: (value) => validateFieldNotEmpty(value),
                  controller: amountController,
                  onComplete: () async {},
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 6)),
                  // inputFormatter: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly
                  // ], //
                  // keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
              ),
              TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    onValChange();
                    controller.changeSreatedQr();
                  },
                  child: Text("Generate Code"))
            ],
          ),
        ),
        val == null
            ? SizedBox()
            : RepaintBoundary(
                key: previewContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(32),
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SfBarcodeGenerator(
                          value: val,
                          // backgroundColor: appColor,
                          symbology: QRCode(),
                          showValue: false,
                          barColor: Colors.black),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                  ],
                ),
              ),
      ]),
    );
  }
}
