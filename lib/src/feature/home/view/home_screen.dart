import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qrscan/src/core/app_textstyles.dart';
import 'package:qrscan/src/core/colors.dart';
import 'package:qrscan/src/core/extensions.dart';
import 'package:qrscan/src/feature/home/notifier/scan_notifier.dart';
import 'package:qrscan/src/feature/home/widget/activity_container.dart';
import 'package:url_launcher/url_launcher.dart';

String formatDate(String date) =>
    DateFormat.yMMMEd('en_US').format(DateTime.parse(date));

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(scanScreenNotifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => controller.scan(),
          backgroundColor: AppColors.primary,
          label: Row(
            children: [
              const Icon(
                CupertinoIcons.qrcode,
                color: AppColors.white,
              ),
              context.hSpace(2),
              Text("Scan Code",
                  style: AppTextStyles.subtitle(context).copyWith(
                    // fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   'Hello, Ankuri',
            //   //  style: AppTextStyles.optionStyle,
            // ),
            context.vSpace(5),
            RichText(
                text: TextSpan(
              style: AppTextStyles.optionStyle.copyWith(),
              children: const [
                TextSpan(text: 'Scan ', style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: 'Qr-Code',
                  style: TextStyle(
                      color: AppColors.primary), // Set your desired color here
                ),
              ],
            )),
            context.vSpace(30),
            Container(
              // height: MediaQuery.of(context).size.height / 5,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: activityContainer(context, "Scanned QR-Code",
                          controller.scans.length.toString())),
                  context.hSpace(20),
                  Expanded(
                      child: activityContainer(context, "Created QR-Code",
                          controller.createdQr.toString())),
                ],
              ),
            ),
            context.vSpace(30),
            Row(
              children: [
                Text('Recent Scans',
                    style: AppTextStyles.optionStyle.copyWith(fontSize: 24)),
                const Spacer(),
              ],
            ),
            context.vSpace(30),
            Expanded(
              // height: MediaQuery.of(context).size.height / 10,
              child: controller.scans.isEmpty
                  ? const Center(child: Text("No recent scan"))
                  : ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.scans.length,
                      itemBuilder: (context, index) {
                        List<TextSpan> extractText(String rawString) {
                          List<TextSpan> textSpan = [];

                          final urlRegExp = RegExp(
                              r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

                          getLink(String linkString) {
                            textSpan.add(
                              TextSpan(
                                text: linkString,
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    // await canLaunchUrl(Uri.parse(linkString));
                                    await launchUrl(Uri.parse(linkString));
                                  },
                              ),
                            );
                            return linkString;
                          }

                          getNormalText(String normalText) {
                            textSpan.add(
                              TextSpan(
                                text: normalText,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                            return normalText;
                          }

                          rawString.splitMapJoin(
                            urlRegExp,
                            onMatch: (m) => getLink("${m.group(0)}"),
                            onNonMatch: (n) => getNormalText(n.substring(0)),
                          );

                          return textSpan;
                        }

                        return ListTile(
                          leading: const Icon(
                            CupertinoIcons.qrcode,
                            color: AppColors.primary,
                          ),
                          title: Text(controller.scans[index].name,
                              style: AppTextStyles.subtitle(context).copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                          subtitle: SelectableText.rich(
                            TextSpan(
                                children: extractText(
                                    controller.scans[index].content),
                                style: AppTextStyles.subtitle(context).copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          trailing: Text(
                              formatDate(controller.scans[index].type),
                              style: AppTextStyles.subtitle(context).copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
