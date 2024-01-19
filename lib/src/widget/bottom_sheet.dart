// import 'package:flutter/material.dart';
// import 'package:qrscan/src/core/extensions.dart';
//
// import '../core/app_textstyles.dart';
// import 'app_button.dart';
// import 'app_text_filed.dart';
//
// Future<void> customBottomSheet(BuildContext context, int index) {
//   return showModalBottomSheet<void>(
//       backgroundColor: Colors.white,
//       context: context,
//       enableDrag: true,
//       isScrollControlled: true,
//       builder: (context) {
//         return DefaultTabController(
//           length: 2,
//           initialIndex: index,
//           child: Wrap(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     context.vSpace(50),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                         color: Colors.grey[200],
//                       ),
//                       width: context.dy(300),
//                       margin: EdgeInsets.only(left: 16, right: 16),
//                       child: TabBar(
//                         padding: EdgeInsets.zero,
//                         indicatorPadding: EdgeInsets.zero,
//                         labelPadding: EdgeInsets.zero,
//                         unselectedLabelColor: Colors.black,
//                         labelColor: Colors.white,
//                         tabs: ["Buy", "Sell"].map((e) {
//                           return Tab(
//                             text: (e),
//                           );
//                         }).toList(),
//                         indicator: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             )),
//                             color: Colors.black),
//                       ),
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.7,
//                       child: TabBarView(
//                         children: <Widget>[
//                           ListView(
//                             children: [
//                               context.vSpace(50),
//                               Text('You pay'),
//                               context.vSpace(5),
//                               amountTextfield(context),
//                               context.vSpace(20),
//                               usdContainer(context),
//                               context.vSpace(40),
//                               swapIcon(),
//                               context.vSpace(40),
//                               Text('You get'),
//                               context.vSpace(5),
//                               btcTextfield(context),
//                               context.vSpace(150),
//                               CrypomartButton(
//                                 onPressed: () {
//                                   continueBottomSheet(context);
//                                 },
//                                 label: 'Continue',
//                               ),
//                               context.vSpace(20),
//                             ],
//                           ),
//                           ListView(
//                             children: [
//                               context.vSpace(50),
//                               Text('You pay'),
//                               context.vSpace(5),
//                               amountTextfield(context),
//                               context.vSpace(20),
//                               usdContainer(context),
//                               context.vSpace(40),
//                               swapIcon(),
//                               context.vSpace(40),
//                               Text('You get'),
//                               context.vSpace(5),
//                               btcTextfield(context),
//                               context.vSpace(150),
//                               CrypomartButton(
//                                 onPressed: () {},
//                                 label: 'Continue',
//                               ),
//                               context.vSpace(20),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))));
// }
//
// Widget btcTextfield(BuildContext context) {
//   return CustomTextFormField(
//     hintText: 'Amount show up here',
//     suffixIcon: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: Color(0xFF542754)),
//       margin: EdgeInsets.all(8),
//       height: context.dy(51),
//       width: context.dx(84),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'BTC',
//             style: AppTextStyles.smallSubtitle(context, color: Colors.white),
//           ),
//           Icon(
//             Icons.keyboard_arrow_down_outlined,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget swapIcon() {
//   return CircleAvatar(
//     backgroundColor: Colors.white,
//     child: Icon(
//       Icons.swap_horiz,
//       color: Colors.black,
//     ),
//   );
// }
//
// Widget usdContainer(BuildContext context) {
//   return Container(
//     height: context.dy(51),
//     width: MediaQuery.of(context).size.width,
//     child: Center(
//       child: Text(
//         '680/USD',
//       ),
//     ),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Color(0xFFF6FFF9),
//     ),
//   );
// }
//
// Widget amountTextfield(BuildContext context) {
//   return CustomTextFormField(
//     filled: true,
//     // fillColor: Color(0xFFF6FFF9),
//     hintText: 'Enter Amount',
//     suffixIcon: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: Color(0xFF004E1F)),
//       margin: EdgeInsets.all(8),
//       height: context.dy(51),
//       width: context.dx(84),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'NGN',
//             style: AppTextStyles.smallSubtitle(context, color: Colors.white),
//           ),
//           Icon(
//             Icons.keyboard_arrow_down_outlined,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Future<void> continueBottomSheet(BuildContext context) {
//   return showModalBottomSheet<void>(
//       backgroundColor: Colors.white,
//       context: context,
//       enableDrag: true,
//       isScrollControlled: true,
//       builder: (context) {
//         return Wrap(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   context.vSpace(50),
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))));
// }
