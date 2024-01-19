import 'package:flutter/material.dart';
import 'package:qrscan/src/core/app_textstyles.dart';
import 'package:qrscan/src/core/colors.dart';

Widget activityContainer(BuildContext context, String name, String value) =>
    Material(
      elevation: 4, // Set the elevation of the Material widget
      borderRadius:
          BorderRadius.circular(12.0), // Applies to the outer Container
      child: Container(
        padding: EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,
                    style: AppTextStyles.subtitle(context)
                        .copyWith(color: AppColors.white)),
                Text(value,
                    style: AppTextStyles.heading3(context)
                        .copyWith(color: AppColors.white, fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );

Widget dialyActivity(BuildContext context) => Material(
      elevation: 4, // Set the elevation of the Material widget
      borderRadius:
          BorderRadius.circular(12.0), // Applies to the outer Container
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            // Handle button tap here
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('FRI', style: TextStyle(color: AppColors.primary)),
                Text('05',
                    style: TextStyle(color: AppColors.primary, fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
