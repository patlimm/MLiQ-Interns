import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mliq/providers/service_provider.dart';

class ProgramsTabBar extends ConsumerWidget {
  const ProgramsTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch for the state changes using ref.watch()
    final historyList = ref.watch(historyListProvider);
    bool isDarkTheme = ref.watch(isDarkThemeProvider);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              },
            ),
            unselectedLabelColor: Theme.of(context).disabledColor,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
            ),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
            tabs: const <Widget>[
              Tab(
                text: 'My Specialty Program',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: TabBarView(
              children: [
                // TabBarView for 'My Specialty Program' tab
                // Replace this with the content for 'My Specialty Program' tab
                Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text('My Specialty Program Content'),
                  ),
                ),
                // TabBarView for 'History' tab
                // Use ref.watch to get the historyList
                ListView.builder(
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: isDarkTheme ? Colors.teal : Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1a000000),
                              blurRadius: 15,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  historyList[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xff1e1e1e),
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
