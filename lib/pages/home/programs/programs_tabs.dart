import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/service_provider.dart';

class ProgramsTabBar extends ConsumerWidget {
  const ProgramsTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specialtyProgramList = ref.watch(specialtyProgramListProvider);
    final historyList = ref.watch(historyListProvider);
    final isDarkTheme = ref.watch(isDarkThemeProvider);

    Widget buildListItem(String text) => Container(
          height: 50,
          decoration: BoxDecoration(
            color: isDarkTheme ? Theme.of(context).cardColor : Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1a000000),
                  blurRadius: 11,
                  offset: Offset(0, 0),
                  spreadRadius: 0)
            ],
          ),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: isDarkTheme ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.right_chevron,
                    size: 15,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) => states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent),
              unselectedLabelColor: Theme.of(context).disabledColor,
              labelColor: Theme.of(context).textTheme.bodyLarge?.color,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              indicator: UnderlineTabIndicator(
                insets: const EdgeInsets.symmetric(horizontal: 20),
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 2, color: Colors.blue),
              ),
              tabs: const <Widget>[
                Tab(text: 'My Specialty Program'),
                Tab(text: 'History'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: specialtyProgramList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: buildListItem(specialtyProgramList[index]),
                    ),
                  ), // TabBarView for 'My Specialty Program' tab
                  ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: buildListItem(historyList[index]),
                    ),
                  ), // TabBarView for 'History' tab
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
