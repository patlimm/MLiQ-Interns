// landing screen in clinical
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/pages/home/clinical/clinical_components/clinical_cards.dart';
import 'package:mliq/routes/app_route_names.dart';

import 'clinical_components/navigating_icons.dart';

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
                    NavigatingIcons(isDarkTheme: isDarkTheme),
                    const SizedBox(height: 30.0),

                    // the content below the icons
                    const Center(
                      child: Text(
                        'My Priorities',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // cards under the 'My Priorities'
                    const ClinicalCards(),
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
