import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/routes/app_route_names.dart';

class OnboardingV2Page extends ConsumerStatefulWidget {
  const OnboardingV2Page({super.key});

  @override
  ConsumerState<OnboardingV2Page> createState() => _OnboardingV2PageState();
}

class _OnboardingV2PageState extends ConsumerState<OnboardingV2Page> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double appBarheight = 56 + MediaQuery.of(context).viewPadding.top;
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    int pageNumber = ref.watch(pageNumberProvider);
    List<PageChoice> pageChoice = ref.watch(pageChoiceListProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Image(
          image: AssetImage(
            'lib/assets/onboarding/screen1/logo.png',
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.goNamed(AppRouteNames.auth);
          },
          icon: const Image(
              image: AssetImage('lib/assets/onboarding/screen1/back.png')),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImages[pageNumber]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: appBarheight, left: 10.0, right: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ready to get started',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  Text(
                    'Take our onboarding survey as your first step to improve your lifestyle',
                    style: TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.1),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                height: (MediaQuery.of(context).size.height / 1.60) + 20,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x20000000),
                        offset: Offset(0, 2),
                        blurRadius: 35,
                        spreadRadius: 0),
                  ],
                  color: isDarkTheme ? Colors.grey[900] : Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.05),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 27.0),
                height: (MediaQuery.of(context).size.height / 1.60) + 10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x20000000),
                        offset: Offset(0, 2),
                        blurRadius: 35,
                        spreadRadius: 0),
                  ],
                  color: isDarkTheme ? Colors.grey[900] : Colors.white,
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: 6,
            controller: _controller,
            onPageChanged: (index) {
              ref.read(pageNumberProvider.notifier).state = index;
            },
            itemBuilder: (content, index) {
              return Align(
                alignment: const Alignment(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: MediaQuery.of(context).size.height / 1.60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x20000000),
                            offset: Offset(0, 2),
                            blurRadius: 35,
                            spreadRadius: 0),
                      ],
                      color: isDarkTheme ? Colors.grey[900] : Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              onboardingQnA[pageNumber].questions,
                              style: const TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.00),
                              shrinkWrap: true,
                              itemCount:
                                  onboardingQnA[pageNumber].answers.length,
                              itemBuilder: (context, index) {
                                bool isSelected = false;

                                if (pageNumber >= 0 &&
                                    pageNumber < pageChoice.length) {
                                  isSelected =
                                      index == pageChoice[pageNumber].selected;
                                }
                                return SizedBox(
                                  child: InkWell(
                                    onTap: () {
                                      if (pageNumber <= pageChoice.length - 1) {
                                        ref
                                            .read(
                                                pageChoiceListProvider.notifier)
                                            .updatePageChoice(
                                                pageNumber, index);
                                      } else {
                                        ref
                                            .read(
                                                pageChoiceListProvider.notifier)
                                            .addPageChoice(pageNumber, index);
                                      }
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 250),
                                          curve: Curves.easeInExpo);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5.0),
                                      width: 280,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: isDarkTheme
                                            ? isSelected
                                                ? Colors.orange
                                                : Colors.grey[850]
                                            : isSelected
                                                ? Colors.orange
                                                : Colors.grey[200],
                                      ),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              onboardingQnA[pageNumber]
                                                  .answers[index],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: isDarkTheme
                                                    ? isSelected
                                                        ? Colors.white
                                                        : Colors.white
                                                    : isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.166666667 * (pageNumber + 1),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  '${pageNumber + 1} of 6',
                  style: const TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
