import 'package:flutter/material.dart';
import 'package:qrscan/src/core/colors.dart';
import 'package:qrscan/src/core/extensions.dart';

Widget startActivity(BuildContext context, icon, title) => Material(
      elevation: 4, // Set the elevation of the Material widget
      borderRadius:
          BorderRadius.circular(12.0), // Applies to the outer Container
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.43,
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
                Icon(
                  icon,
                  color: AppColors.primary,
                  size: 70,
                ),
                context.vSpace(20),
                Text(title,
                    style: TextStyle(color: AppColors.primary, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
