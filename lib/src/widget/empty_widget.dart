import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrscan/src/core/extensions.dart';

import '../core/app_textstyles.dart';
import '../core/colors.dart';
import '../core/images.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.empty,
          height: context.dy(189),
        ),
        context.vSpace(30),
        Text(
          "No Transactions Yet",
          style: AppTextStyles.heading3(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        context.vSpace(10),
        Text(
          "Any transaction you make will appear here so start trading.",
          style: AppTextStyles.smallSubtitle(context).copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.getColorFromHex("898989")),
        ),
      ],
    );
  }
}
