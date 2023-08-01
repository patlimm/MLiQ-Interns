import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/service_provider.dart';



// DEPRECATED
class PrenatalWelnessCare extends ConsumerWidget {
  final String title;
  final GestureTapCallback? onTap;
  const PrenatalWelnessCare({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    final tileColor = isDarkTheme ? const Color(0x05ffffff) : Colors.white;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: isDarkTheme ? const Color(0x1a000000) : Colors.black,
      color: tileColor,
      elevation: 5,
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
