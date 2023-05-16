// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:onepiece_quiz_king/const/const.dart';
// import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
//
// class selectedAnswerListPart extends ConsumerWidget {
//   final List list;
//   final bool ableToPress;
//
//   selectedAnswerListPart({required this.list, required this.ableToPress});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     MainViewModel _mainViewModel = MainViewModel();
//     return Padding(
//       padding:
//       const EdgeInsets.only(top: 50.0, left: 20, right: 20),
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: list.length,
//         itemBuilder: (BuildContext context, int index) {
//           final item = list[index];
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Material(
//               color: subColor,
//               child: InkWell(
//                 onTap: () => ableToPress
//                     ? _mainViewModel.checkAnswer(item, _mainViewModel.currentWord.strAnswer, ref)
//                     : null,
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: redColor, width: 1.5),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment:
//                           MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               item,
//                               style: lanobeAnswerTextStyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
