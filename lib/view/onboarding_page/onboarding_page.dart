import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'onboarding_pages/onboarding_page_1.dart';
import 'onboarding_pages/onboarding_page_2.dart';
import 'onboarding_pages/onboarding_page_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  // ignore: override_on_non_overriding_member
  int _activePage = 0;

  final List<Widget> _pages = [
    const OnboardingPageOne(),
    const OnboardingPageTwo(),
    const OnboardingPageThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              }),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          width: _activePage == index ? 50 : 22,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _activePage == index
                                ? Colors.amber
                                : kPurpleColor,
                          ),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
