import 'package:flutter/material.dart';

import '../core/app_textstyles.dart';
import '../core/colors.dart';

class CrypomartButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final Color? color;
  final Color? bgColor;

  const CrypomartButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.isLoading = false,
    this.color, this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLoading ?   Colors.transparent:bgColor,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all(
                isLoading ? null : Colors.transparent)),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitle(context)
                    .copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
