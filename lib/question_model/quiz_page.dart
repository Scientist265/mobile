import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/question_model/question_model.dart';
import 'package:mobile/screens/pages/notifications.dart';
import 'package:mobile/screens/pages/result_page.dart';
import 'package:mobile/screens/pages/settings.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:get/get.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

Schools? yourCareer;

class _QuizPageState extends State<QuizPage> {
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    Object? getCareer(int score) {
      if (48 == score && score <= 54) {
        return yourCareer?.schoolName;
        // ignore: dead_code
        print(yourCareer?.mySchoolList[1]);
      } else if (40 == score && score <= 47) {
        return yourCareer?.schoolName;
      } else if (31 == score && score <= 39) {
        return yourCareer?.schoolName;
      } else if (18 == score && score <= 30) {
        return yourCareer?.schoolName;
      }

      return 'I am not getting any value';
    }

    Widget _answerButton(Answer answer) {
      bool isLastQuestion = false;
      if (currentQuestionIndex == questionList.length - 1) {
        isLastQuestion = true;
      }
      bool isSelected = answer == selectedAnswer;

      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 80,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 0.5,
                  blurRadius: 0.9,
                  color: Colors.grey,
                )
              ]),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.white;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)))),
              onPressed: () {
                if (isLastQuestion) {
                  // getCareer(score);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(bottom: 40),
                    content: Text(
                      'Getting your result ready please wait...',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ));
                  setState(() {
                    selectedAnswer = null;
                    selectedAnswer = answer;
                    score = score + answer.scoreValue;
                    print(score);
                  });

                  //Delay before displaying the result

                  Future.delayed(const Duration(seconds: 5), () {
                    Get.to(() => const ResultPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 5));
                  });
                } else {
                  setState(() {
                    selectedAnswer = null;
                    currentQuestionIndex++;
                    selectedAnswer = answer;
                    score = score + answer.scoreValue;
                  });
                }
              },
              child: Text(
                answer.answerText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )));
    }

    _answerList() {
      return Column(
        children: questionList[currentQuestionIndex]
            .answerList
            .map((e) => _answerButton(e))
            .toList(),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(190),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/quiz_2_curve.png'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Question ${currentQuestionIndex + 1}/${questionList.length.toString()}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff17301c)),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const NotificationPage(),
                            transition: Transition.zoom,
                          );
                        },
                        child: const Icon(
                          Ionicons.notifications_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const SettingsPage(),
                            transition: Transition.zoom,
                          );
                        },
                        child: const Icon(
                          Ionicons.settings_outline,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    questionList[currentQuestionIndex].questionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ]),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Align(alignment: const Alignment(0, -2), child: _answerList())
              ],
            ),
          ],
        ));
  }
}


/**GestureDetector(
        onTap: () {
          if (isLastQuestion) {
            // getCareer(score);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 40),
              content: Text('Getting you result ready'),
            ));
            setState(() {
              selectedAnswer = null;
              selectedAnswer = answer;
              score = score + answer.scoreValue;
              print(score);
            });
            Get.to(
              () => const ResultPage(),
              transition: Transition.zoom,
              duration: const Duration(seconds: 5),
            );
            getCareer(score);
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
              selectedAnswer = answer;
              score = score + answer.scoreValue;
            });
          }
        },
        child: Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                color: isSelected ? Colors.grey : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(spreadRadius: 2, blurRadius: 2, color: Colors.grey)
                ]),
            child: Text(
              answer.answerText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            )),
      ); */