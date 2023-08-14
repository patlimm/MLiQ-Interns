import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mliq/pages/select_practice.dart';
import '../../../providers/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectDoctor extends ConsumerWidget {
  const SelectDoctor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isDarkTheme = ref.watch(isDarkThemeProvider);
    
    int selectedPracticeIndex = ref.watch(selectedPracticeIndexProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: isDarkTheme 
          ? const AssetImage('lib/assets/images/logo1.png') 
          : const AssetImage('lib/assets/images/logo2.png')   ,
          fit: BoxFit.contain,
          height: isDarkTheme ? 40 : 47,),
        leading: IconButton(
          onPressed: () {
            ref.read(selectedPracticeIndexProvider.notifier).setSelectedIndex(-1);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelectPractice()),
              
            );
          },
          icon:  Icon(
            CupertinoIcons.chevron_back, 
            color: isDarkTheme ? Colors.white : Colors.black,
            ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(selectedPracticeIndexProvider.notifier).setSelectedIndex(-1);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: isDarkTheme ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/wave1x.png'),
                alignment: Alignment.topRight,
              ),
            ),
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          itemCount: doctorNames.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select a Doctor',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {

              final doctorName = doctorNames[index - 1];

              bool isSelected = index - 1 == selectedPracticeIndex;

              return InkWell(
                onTap: () {
                  ref.read(selectedPracticeIndexProvider.notifier)
                      .setSelectedIndex(index - 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: 100,
                    height: 50,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkTheme ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              doctorName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: isDarkTheme ? isSelected ? Colors.blue : Colors.white : isSelected ? Colors.blue : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            CupertinoIcons.checkmark_circle_fill,
                            color: Colors.blue,
                            size: 22,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Save Changes  >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

  }
}