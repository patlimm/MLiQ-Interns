// landing screen in clinical
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/routes/app_route_names.dart';

import '../../../components/custom_icon_text.dart';

class ClinicalParentPage extends StatelessWidget {
  const ClinicalParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/clinical/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              foregroundColor: Colors.black,
              // leading: IconButton(
              //   icon: const Icon(Icons.arrow_back_ios_new),
              //   onPressed: () {
              //     // Navigate back
              //   },
              // ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'lib/assets/clinical/icons/message.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      context.goNamed(AppRouteNames.messages);
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset('lib/assets/clinical/icons/logo.png'),
              ),
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const Text(
                      'Clinical Assessment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Take the assessments below to learn more about your level of health in rach wellness domain and receive advice for improvement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 30),
                    //navigating icons
                    Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: [
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.vitalHealth);
                          },
                          icon: 'lib/assets/clinical/icons/heart.png',
                          title: 'Vital Health',
                          subtitle: 'Take a Test',
                          backgroudColor: const Color(0xffffb812),
                          foregroudColor: const Color(0xffeaa70c),
                        ),
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.flourish);
                          },
                          icon: 'lib/assets/clinical/icons/tree.png',
                          title: 'Flourish',
                          subtitle: 'Take a Test',
                          backgroudColor: Colors.black,
                          foregroudColor: Colors.grey,
                        ),
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.brainHealth);
                          },
                          icon: 'lib/assets/clinical/icons/brain.png',
                          title: 'Brain Health',
                          subtitle: 'Take a Test',
                          backgroudColor: const Color(0xff5b3a82),
                          foregroudColor: const Color(0xff442864),
                        ),
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.nourish);
                          },
                          icon: 'lib/assets/clinical/icons/food.png',
                          title: 'Nourish',
                          subtitle: 'Take a Test',
                          backgroudColor: const Color(0xff11a4d1),
                          foregroudColor: const Color(0xff0d89af),
                        ),
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.movement);
                          },
                          icon: 'lib/assets/clinical/icons/muscle.png',
                          title: 'Movement',
                          subtitle: 'Take a Test',
                          backgroudColor: const Color(0xFFFF851B),
                          foregroudColor: const Color(0xffe05e12),
                        ),
                        CustomIconText(
                          onTap: () {
                            context.pushNamed(AppRouteNames.programs);
                          },
                          icon: 'lib/assets/clinical/icons/books.png',
                          title: 'Programs',
                          subtitle: 'Take a Test',
                          backgroudColor: const Color(0xff594b4b),
                          foregroudColor: const Color(0xff4c3b3b),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
