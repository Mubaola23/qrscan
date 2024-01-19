import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qrscan/src/core/extensions.dart';

import '../../../core/app_textstyles.dart';
import '../model/onboarding_model.dart';
import 'page_indicators.dart';

Widget onboardingImages(
    int index, BuildContext context, StateController<int> currentPageIndex) {
  return Stack(
    children: [
      Opacity(
        opacity: 0.8,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment(0.0, -1),
              colors: <Color>[
                const Color(0x8A000000),
                Colors.black12.withOpacity(0.0)
              ],
            ),
          ),
          child: Image.asset(
            onboardingList[index].image,
            height: 700,
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.darken,
          ),
        ),
      ),
      Positioned(
          bottom: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingList[index].text1,
                  style: AppTextStyles.heading1(context)
                      .copyWith(color: Colors.white),
                ),
                context.vSpace(20),
                Container(
                  width: context.dx(300),
                  child: Text(
                    onboardingList[index].text2,
                    style: AppTextStyles.smallText(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
      Positioned(
        bottom: 30,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageIndicators(currentPageIndex.state, context),
        ),
      ),
    ],
  );
}
