// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/onboarding_model.dart';
import 'widgets/onboardingImages.dart';

final onboadingCurrentPageIndex = StateProvider.autoDispose<int>((ref) => 0);

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final currentPageIndex = ref.watch(onboadingCurrentPageIndex.state);

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 5,
          child: PageView.builder(
            itemCount: onboardingList.length,
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                color: index == 0
                    ? Color(0xffFDFDDD)
                    : index == 1
                        ? Color(0xff542754)
                        : Color(0xff2885FF),
                child: onboardingImages(index, context, currentPageIndex),
              );
            },
            onPageChanged: (index) {
              currentPageIndex.state = index;
            },
          ),
        ),
      ],
    ));
  }
}
