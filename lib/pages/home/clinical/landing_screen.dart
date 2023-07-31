// landing screen in clinical
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/components/my_priorities.dart';
import 'package:mliq/routes/app_route_names.dart';

import '../../../components/custom_icon_text.dart';
import '../../../providers/service_provider.dart';

class ClinicalParentPage extends ConsumerWidget {
  const ClinicalParentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    final bgImage = isDarkTheme
        ? const AssetImage('lib/assets/clinical/bgdark.png')
        : const AssetImage('lib/assets/clinical/bg.png');
    final Widget messageIcon = isDarkTheme
        ? Image.asset(
            'lib/assets/clinical/icons/messagedark.png',
            width: 24,
            height: 24,
          )
        : SvgPicture.asset(
            'lib/assets/clinical/icons/message.svg',
            width: 24,
            height: 24,
          );
    final Widget logo = isDarkTheme
        ? Image.asset(
            'lib/assets/clinical/icons/logodark.png',
            width: 85,
            height: 43,
          )
        : SvgPicture.asset(
            'lib/assets/clinical/icons/logolight.svg',
            width: 85,
            height: 43,
          );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage,
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
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: logo,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: messageIcon,
                    onPressed: () {
                      context.goNamed(AppRouteNames.messages);
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 9.0),
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
                    const SizedBox(height: 30.0),
                    // the content below the icons
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'My Priorities',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Prenatal Welness Care',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        PrenatalWelnessCare(
                          title: 'Breast Examination',
                          onTap: () {},
                        ),
                        PrenatalWelnessCare(
                          title: 'Pelvic Examination',
                          onTap: () {},
                        ),
                        PrenatalWelnessCare(
                          title: 'Sample Examination',
                          onTap: () {},
                        ),
                        PrenatalWelnessCare(
                          title: 'Sample Examination',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
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
