import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/providers/service_provider.dart';
import 'package:mliq/routes/app_route_names.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late PageController _controller;
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);

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
      body: PageView.builder(
        itemCount: 6,
        controller: _controller,
        itemBuilder: (content, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/onboarding/screen$pageNumber/ebg@3x.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 56),
                    child: Column(
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
                  Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            height:
                                (MediaQuery.of(context).size.height / 1.60) +
                                    20,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x20000000),
                                    offset: Offset(0, 2),
                                    blurRadius: 35,
                                    spreadRadius: 0),
                              ],
                              color:
                                  isDarkTheme ? Colors.grey[900] : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 27.0),
                            height:
                                (MediaQuery.of(context).size.height / 1.60) +
                                    10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x20000000),
                                    offset: Offset(0, 2),
                                    blurRadius: 35,
                                    spreadRadius: 0),
                              ],
                              color:
                                  isDarkTheme ? Colors.grey[900] : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: MediaQuery.of(context).size.height / 1.60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x20000000),
                                    offset: Offset(0, 2),
                                    blurRadius: 35,
                                    spreadRadius: 0),
                              ],
                              color:
                                  isDarkTheme ? Colors.grey[900] : Colors.white,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'question sample',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding:
                                          const EdgeInsets.only(top: 20.00),
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            _controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 250),
                                                curve: Curves.easeInExpo);
                                            pageNumber++;
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(5.0),
                                            width: 280,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: isDarkTheme
                                                  ? Colors.grey[850]
                                                  : Colors.grey[200],
                                            ),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text('number $index')),
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
                      ),
                    ],
                  ),
                ],
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: 0.166666667 * pageNumber,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.lightBlue),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      '$index of 6',
                      style:
                          const TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
