import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mliq/components/custom_icon_text.dart';

import '../../../routes/app_route_names.dart';

class NavigatingIcons extends StatelessWidget {
  const NavigatingIcons({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
          backgroudColor: isDarkTheme
              ? const Color(0xff555561)
              : const Color(0xff272727),
          foregroudColor: isDarkTheme
              ? const Color(0xff474753)
              : const Color(0x004a4a4a),
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
    );
  }
}