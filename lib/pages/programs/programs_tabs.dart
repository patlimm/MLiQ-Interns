import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyListProvider = StateProvider<List<String>>((ref) => [
      "Alzheimer's",
      "Brain Health",
      "Cleanse / Fatigue",
      "Exercise",
      "Four Core Eating Habits",
      "Gut Restoration",
      "Integrity",
      "Long Haul Covid",
      "Pregnancy",
      "Add more items to the initial list as needed",
    ]);

class ProgramsTabBar extends StatelessWidget {
  const ProgramsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
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
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
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
                width: 2, // Thickness of the indicator line
                color: Colors.blue, // Color of the indicator line
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
                // Use Riverpod Consumer to display the ListView
                Consumer(
                  builder: (context, ref, _) {
                    final historyList = ref.watch(historyListProvider);
                    return ListView.builder(
                      itemCount: historyList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(9),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1a000000),
                                  blurRadius: 12,
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
