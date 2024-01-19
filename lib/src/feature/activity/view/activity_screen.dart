import 'package:flutter/material.dart';
import 'package:qrscan/src/core/app_textstyles.dart';
import 'package:qrscan/src/core/colors.dart';
import 'package:qrscan/src/core/extensions.dart';
import 'package:qrscan/src/feature/activity/widget/start_activity.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
            style: AppTextStyles.optionStyle.copyWith(),
            children: const [
              TextSpan(text: 'Start ', style: TextStyle(color: Colors.black)),
              TextSpan(
                text: 'Activity',
                style: TextStyle(
                    color: AppColors.primary), // Set your desired color here
              ),
            ],
          )),
          context.vSpace(30),
          Row(
            children: [
              startActivity(context, Icons.directions_walk, 'Walking'),
              const Spacer(),
              startActivity(context, Icons.add_alarm_outlined, 'Tadmill'),
            ],
          ),
          context.vSpace(30),
          Row(
            children: [
              startActivity(context, Icons.directions_run, 'Running'),
              const Spacer(),
              startActivity(context, Icons.directions_bike, 'Cycling'),
            ],
          ),
          context.vSpace(30),
          Row(
            children: [
              startActivity(context, Icons.fitness_center, 'Gym'),
              const Spacer(),
              startActivity(context, Icons.self_improvement, 'Yoga'),
            ],
          ),
        ],
      ),
    );
  }
}
