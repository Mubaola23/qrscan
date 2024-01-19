import 'package:flutter/material.dart';
import 'package:qrscan/src/core/app_textstyles.dart';
import 'package:qrscan/src/core/colors.dart';
import 'package:qrscan/src/core/extensions.dart';

Widget homeContainer(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            right: -20,
            child: Image.asset(
              'assets/img/squat.png',
              height: 450,
            ),
          ),
          Positioned(
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(text: 'Legs ', style: AppTextStyles.text(context)),
                    TextSpan(
                        text: 'and', style: AppTextStyles.smalltext(context)),
                  ],
                )),
                context.vSpace(5),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Clutes ', style: AppTextStyles.text(context)),
                    TextSpan(
                        text: 'workout',
                        style: AppTextStyles.smalltext(context)),
                  ],
                )),
                context.vSpace(10),
                Row(
                  children: [
                    Icon(Icons.bar_chart, size: 10, color: Colors.white),
                    SizedBox(
                        width: 8), // Add some spacing between the Icon and Text
                    Text('Advanced',
                        style: AppTextStyles.extrasmalltext(context)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.lock_clock, size: 10, color: Colors.white),
                    SizedBox(width: 8),
                    Text('43 Min',
                        style: AppTextStyles.extrasmalltext(context)),
                  ],
                ),
                context.vSpace(20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Start Workout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 151, 159, 245),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
