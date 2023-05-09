// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:onepiece_quiz_king/const/const.dart';
// import 'package:onepiece_quiz_king/db/database.dart';
// import 'package:onepiece_quiz_king/models/data/series.dart';
// import 'package:onepiece_quiz_king/main.dart';
// import 'package:onepiece_quiz_king/models/manager/ad_manager.dart';
// import 'package:onepiece_quiz_king/views/components/buttons/ad_part.dart';
// import 'package:onepiece_quiz_king/views/components/buttons/go_next_button.dart';
// import '../components/end_message.dart';
// import '../components/number_of_question_part.dart';
// import '../components/question_card_part.dart';
// import '../components/texts/testscreen_title_text.dart';
//
// enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }
//
// class TestScreen extends StatefulWidget {
//   SERIES series;
//   TestScreen({required this.series});
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   List<String> answersList = [];
//   bool isSelectedAnswerCorrect = false;
//   bool isQuestionCardVisible = false;
//   bool isAnswerCardVisible = false;
//   bool isFabVisible = false;
//   bool isAbleToPress = false;
//   String txtQuestion = "問題";
//   String txtAnswer = "こたえ";
//   int numberOfQuestion = 0;
//   int questionIndex = 0; //いま何問目か
//   List<Word> testDataList = [];
//   TestStatus testStatus = TestStatus.BEFORE_START;
//   int adCount = 5;
//   BannerAd? bannerAd;
//   InterstitialAd? interstitialAd;
//   int numInterstitialLoadAttempt = 0;
//   late Word currentWord = Word(
//     strQuestion: "",
//     strAnswer: "",
//     isMemorized: false,
//     series: 1,
//     level: 1,
//     fakeFirst: '',
//     fakeSecond: '',
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _getTestData();
//     getBannerAd();
//     loadBannerAd();
//     initInterstitialAd(interstitialAd);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     bannerAd?.dispose();
//     interstitialAd?.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       backgroundColor: subColor,
//       navigationBar: CupertinoNavigationBar(
//         middle: TestScreenTitleText(series: widget.series),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios_new_rounded, color: whiteColor),
//         ),
//         backgroundColor: mainColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 20, bottom: 20),
//         child: Stack(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 //のこり問題数表示部分
//                 NumberOfQuestionPart(numberOfQuestion: numberOfQuestion),
//                 SizedBox(height: 20),
//                 // 問題カード表示部分
//                 QuestionCardPart(
//                   isQuestionCardVisible: isQuestionCardVisible,
//                   txtQuestion: txtQuestion,
//                   level: currentWord.level,
//                 ),
//                 //選択肢カード表示部分
//                 isQuestionCardVisible
//                     ? Padding(
//                         padding: const EdgeInsets.only(
//                             top: 50.0, left: 20, right: 20),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: answersList.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final item = answersList[index];
//                             return Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Material(
//                                 color: subColor,
//                                 child: InkWell(
//                                   onTap: () => isAbleToPress
//                                       ? _checkAnswer(
//                                           item, currentWord.strAnswer)
//                                       : null,
//                                   child: Card(
//                                     elevation: 4,
//                                     child: Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: redColor, width: 1.5),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Center(
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 item,
//                                                 style: lanobeAnswerTextStyle,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : Container(),
//                 SizedBox(height: 40),
//               ],
//             ),
//             //次へボタン
//             Positioned(
//               right: 30,
//               bottom: 70,
//               child: GoNextButton(
//                 isFabVisible: isFabVisible,
//                 testDataList: testDataList,
//                 onPressed: () => _goNextStatus(),
//               ),
//             ),
//             //終了メッセージ
//             EndMessage(testStatus: testStatus),
//             AdPart(bannerAd: bannerAd),
//             //正解のとき
//             isAnswerCardVisible && isSelectedAnswerCorrect
//                 ? Center(child: Image.asset("assets/images/pic_correct.png"))
//                 : Container(),
//             //不正解のとき
//             isAnswerCardVisible && !isSelectedAnswerCorrect
//                 ? Center(child: Image.asset("assets/images/pic_incorrect.png"))
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _goNextStatus() async {
//     switch (testStatus) {
//       case TestStatus.BEFORE_START:
//         testStatus = TestStatus.SHOW_QUESTION;
//         _showQuestion();
//         break;
//       case TestStatus.SHOW_QUESTION:
//         break;
//       case TestStatus.SHOW_ANSWER:
//         if (numberOfQuestion <= 0) {
//           setState(() {
//             isFabVisible = false;
//             testStatus = TestStatus.FINISHED;
//             answersList = [];
//           });
//         } else {
//           testStatus = TestStatus.SHOW_QUESTION;
//           answersList = [];
//           _showQuestion();
//         }
//         break;
//       case TestStatus.FINISHED:
//         break;
//     }
//   }
//
//   void _showQuestion() async {
//     currentWord = testDataList[questionIndex];
//     await refreshAnswerList();
//     setState(() {
//       isQuestionCardVisible = true;
//       isAnswerCardVisible = false;
//       isFabVisible = false;
//       txtQuestion = currentWord.strQuestion;
//       isFabVisible = false;
//       isAbleToPress = true;
//     });
//     numberOfQuestion -= 1;
//     questionIndex += 1;
//   }
//
//   void _getTestData() async {
//     switch (widget.series) {
//       case SERIES.ALL:
//         testDataList = await database.allWords;
//         break;
//       case SERIES.LEVEL1:
//         testDataList = await database.allWordsOflevel1;
//         break;
//       case SERIES.LEVEL2:
//         testDataList = await database.allWordsOflevel2;
//         break;
//       case SERIES.LEVEL3:
//         testDataList = await database.allWordsOflevel3;
//         break;
//       case SERIES.LEVEL4:
//         testDataList = await database.allWordsOflevel4;
//         break;
//       case SERIES.EASTBLUE:
//         testDataList = await database.seriesOfEastBlue;
//         break;
//       case SERIES.ALABASTA:
//         testDataList = await database.seriesOfAlaBasta;
//         break;
//       case SERIES.SKYISLAND:
//         testDataList = await database.seriesOfSkyIsland;
//         break;
//       case SERIES.WATERSEVEN:
//         testDataList = await database.seriesOfWaterSeven;
//         break;
//       case SERIES.THRILLERBARK:
//         testDataList = await database.seriesOfThrillerBark;
//         break;
//       case SERIES.IMPELDOWN:
//         testDataList = await database.seriesOfImpelDown;
//         break;
//       case SERIES.FISHMANISLAND:
//         testDataList = await database.seriesOfFishmanIsland;
//         break;
//       case SERIES.DRESSROSA:
//         testDataList = await database.seriesOfDressRosa;
//         break;
//       case SERIES.WHOLECAKEISLAND:
//         testDataList = await database.seriesOfWholeCakeIsland;
//         break;
//       case SERIES.WANOKUNI:
//         testDataList = await database.seriesOfWaNoKuni;
//         break;
//     }
//     testDataList.shuffle();
//     testStatus = TestStatus.BEFORE_START;
//     questionIndex = 0;
//
//     setState(() {
//       isQuestionCardVisible = false;
//       isAnswerCardVisible = false;
//       isFabVisible = true;
//       numberOfQuestion = testDataList.length;
//     });
//   }
//
//   refreshAnswerList() async {
//     setState(() {
//       answersList = [];
//       answersList.add(currentWord.strAnswer);
//       answersList.add(currentWord.fakeFirst);
//       answersList.add(currentWord.fakeSecond);
//       answersList.shuffle();
//     });
//   }
//
//   _checkAnswer(String selectedAnswer, String correctAnswer) async {
//     testStatus = TestStatus.SHOW_ANSWER;
//     setState(() {
//       isQuestionCardVisible = true;
//       isAnswerCardVisible = true;
//       isFabVisible = false;
//       isAbleToPress = false;
//     });
//     if (selectedAnswer == correctAnswer) {
//       setState(() async {
//         isAnswerCardVisible = true;
//         isSelectedAnswerCorrect = true;
//         await Future.delayed(Duration(seconds: 1));
//         adCount--;
//         if (adCount <= 0) {
//           await loadInterstitialAd(interstitialAd);
//           adCount = 5;
//         }
//         if (numberOfQuestion <= 0) {
//           setState(() {
//             isFabVisible = false;
//             testStatus = TestStatus.FINISHED;
//             answersList = [];
//           });
//         } else {
//           setState(() {
//             testStatus = TestStatus.SHOW_QUESTION;
//             answersList = [];
//             _showQuestion();
//           });
//         }
//       });
//     } else {
//       setState(
//         () async {
//           isAnswerCardVisible = true;
//           isSelectedAnswerCorrect = false;
//           await Future.delayed(Duration(seconds: 1));
//           adCount--;
//           if (adCount <= 0) {
//             await loadInterstitialAd(interstitialAd);
//             adCount = 5;
//           }
//           if (numberOfQuestion <= 0) {
//             setState(
//               () {
//                 isFabVisible = false;
//                 testStatus = TestStatus.FINISHED;
//                 answersList = [];
//               },
//             );
//           } else {
//             setState(() {
//               testStatus = TestStatus.SHOW_QUESTION;
//               answersList = [];
//               _showQuestion();
//             });
//           }
//         },
//       );
//     }
//   }
//   void getBannerAd() {
//     bannerAd = BannerAd(
//       size: AdSize.banner,
//       adUnitId: AdManager.bannerAdUnitId,
//       listener: BannerAdListener(),
//       request: AdRequest(),
//     );
//   }
//
//   void initInterstitialAd(interstitialAd) {
//     InterstitialAd.load(
//       adUnitId: AdManager.interstitialAdUnitId,
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           interstitialAd = ad;
//           numInterstitialLoadAttempt = 0;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           interstitialAd = null;
//           numInterstitialLoadAttempt++;
//           if (numInterstitialLoadAttempt <= 3)
//             initInterstitialAd(interstitialAd);
//         },
//       ),
//     );
//   }
//
//   Future<void> loadInterstitialAd(interstitialAd) async {
//     if (interstitialAd == null) return;
//     interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (InterstitialAd ad) {
//           ad.dispose();
//           initInterstitialAd(interstitialAd);
//         }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       ad.dispose();
//       initInterstitialAd(interstitialAd);
//     });
//     await interstitialAd!.show();
//     interstitialAd = null;
//   }
//
//   void loadBannerAd() {
//     bannerAd?.load();
//   }
// }
