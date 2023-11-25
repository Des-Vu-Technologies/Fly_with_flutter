import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';
import '../resources/route_manager.dart';

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  OnboardingScreen(
      {required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imagePath),
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            // Add additional widgets as needed, such as buttons or indicators
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _onboardingScreens = [
    OnboardingScreen(
      title: 'Welcome to MyApp',
      description: 'Discover amazing features!',
      imagePath:
          'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=1024x1024&w=is&k=20&c=iGtRKCTRSvPVl3eOIpzzse5SvQFfImkV0TZuFh-74ps=',
    ),
    OnboardingScreen(
      title: 'Explore and Enjoy',
      description: 'Get started with our app!',
      imagePath:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    ),
    OnboardingScreen(
      title: 'Explore and Enjoy',
      description: 'Get started with our app!',
      imagePath:
          'https://media.istockphoto.com/id/1455965102/photo/beautiful-sunrise-bursting-through-the-eucalyptus-trees-as-it-rises-over-a-mountain-beside-a.jpg?s=1024x1024&w=is&k=20&c=wYGK__qz9i8M7NfBvkNtkfbWNoiBxDLGi64PQjOo_wY=',
    ),
    // Add more OnboardingScreen widgets as needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
//this function returns a gesture detector with svgpicture as child checking the
//

  Widget _getProperBottons(int index, int currentIndex) {
    if (index == currentIndex) {
      return GestureDetector(
        child: SvgPicture.asset(
            height: 20, 'assets/images/circleHollowBottomAppbarBoarding.svg'),
      );
    } else {
      return GestureDetector(
        child: SvgPicture.asset(
            height: 17, 'assets/images/circleSolidBottomAppbarBoarding.svg'),
      );
    }
  }

//build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onboardingScreens.length,
        itemBuilder: (BuildContext context, int index) {
          return _onboardingScreens[index];
        },
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      // You can add navigation buttons, indicators, or skip buttons here
      bottomSheet: Container(
        color: Colors.white,
        height: 100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: const Text(
                  "Skip",
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Container(
              color: ColorManager.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back icon
                  IconButton(
                    onPressed: () {
                      _pageController.animateToPage(getPrevious(_currentPage),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),

                  //radios

                  Row(
                    children: [
                      for (int i = 0; i < _onboardingScreens.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _getProperBottons(i, _currentPage),
                        )
                    ],
                  ),

                  //forward icon

                  IconButton(
                    onPressed: () {
                      _pageController.animateToPage(getNext(_currentPage),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  int getNext(int currentPage) {
    int NewPage = ++currentPage;
    if (currentPage == _onboardingScreens.length) {
      return 0;
    }

    return NewPage;
  }

  int getPrevious(int currentPage) {
    int NewPage = --currentPage;
    if (currentPage < 0) {
      return _onboardingScreens.length;
    }

    return NewPage;
  }
}
