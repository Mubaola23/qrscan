import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_textstyles.dart';
import '../core/colors.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? filled;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxlength;
  final InputBorder? border;
  final String? title;
  final String? label;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onComplete;
  final Color? borderColor;
  final Color? color;
  final double? height;
  final bool? enabled;
  final Widget? input;
  final Function(String?)? onSaved;
  final String? intial;

  const AppTextFormField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.preffixIcon,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.borderColor,
    this.color = Colors.black87,
    this.filled,
    this.input,
    this.maxlength,
    this.border,
    this.title,
    this.height,
    this.enabled = true,
    this.onSaved,
    this.intial,
    this.inputFormatter,
    this.onComplete,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!.toUpperCase(),
                style: AppTextStyles.smallText(context),
              )
            : const SizedBox(),
        label != null ? const SizedBox(height: 6) : const SizedBox(),
        // Text(
        //   title??"",
        //   // style: kLabelText,
        // ),
        // context.vSpace(0),
        TextFormField(
          textCapitalization: TextCapitalization.words,

          // cursorColor: appColor,
          onEditingComplete: onComplete,
          inputFormatters: inputFormatter,
          initialValue: intial,
          onSaved: onSaved,
          controller: controller,

          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? color
                  : AppColors.white,
              fontSize: 20,
              height: height),
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          validator: validator,
          maxLength: maxlength,
          keyboardType: keyboardType,
          enabled: enabled,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : AppColors.black,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            contentPadding: const EdgeInsets.all(16),
            border: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? Color(0xFFE4ECF1), width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
