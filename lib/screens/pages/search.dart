import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/pages/interest_page_2.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> interestSelected = [];
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const Icon(Icons.arrow_back_ios),
          const SizedBox(height: 25),
          const Text(
            'What are your Interests?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Select all the things that you find interesting',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: interestAvailable.length,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      isChoose = !isChoose;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            !isChoose ? const Color(0xffc3ccd6) : Colors.green),
                    child: Center(
                      child: Text(
                        interestAvailable[index],
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            buttonText: 'Continue',
            onTap: () {
              Get.to(() => InterestPage2(),
                  transition: Transition.circularReveal,
                  duration: const Duration(seconds: 3));
            },
          )
        ],
      ),
    ));
  }

  List<String> interestAvailable = [
    'Technology',
    'coding',
    'Entrepreneurship',
    'innovation',
    'Social media',
    'digital marketing',
    'Environment',
    'sustainability',
    'Creative art',
    'writing',
    'storytelling',
    'Graphic design',
    'illustration',
    'Animation',
    'motion graphics',
    'Film',
    'video production',
    'Music production',
    'audio engineering',
    'Gaming',
    'esports',
    'Virtual reality',
    'augmented reality',
    'AI/ML',
    'Robotics',
    'Biotechnology',
    'genetics',
    'Healthcare',
    'medical research',
    'Psychology',
    'mental health',
    'Law',
    'justice',
    'Politics',
    'policy making',
    'Economics',
    'finance',
    'Architecture',
    'urban planning',
    'Interior design',
    'decoration',
    'Fashion',
    'food',
    'hospitality',
    'Sports ',
    'athletics',
    'Education',
    'teaching',
    'Journalism',
    'media',
    'Travel',
    'tourism',
    'activism ',
    'community',
    ' organizing',
  ];
  bool choose() {
    return true;
  }
}
