import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import '../../../providers/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralPage extends ConsumerWidget {
  const ReferralPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isDarkTheme = ref.watch(isDarkThemeProvider);
     final checkboxes = ref.watch(checkboxProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: isDarkTheme 
          ? const AssetImage('lib/assets/images/logo1.png') 
          : const AssetImage('lib/assets/images/logo2.png')   ,
          fit: BoxFit.contain,
          height: isDarkTheme ? 35 : 45,),
        // leading: IconButton(
        //   onPressed: () {
        //   },
        //   icon:  Icon(
        //     CupertinoIcons.chevron_back, 
        //     color: isDarkTheme ? Colors.white : Colors.black,
        //     ),
        // ),
        
        actions: [
          IconButton(
            icon: isDarkTheme 
            ? Image.asset('lib/assets/images/messagedark.png')
            : Image.asset('lib/assets/images/messagelight.png'),
            onPressed: () {
                
              } 
            
            ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/wave1x.png'),
            alignment: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
          children: <Widget> [
               const Padding(
              padding: EdgeInsets.only(top:20),
              child: Align(
                alignment: Alignment.center,
               child: Text('Referral',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              ),
            ),
             const SizedBox(
              width: 310,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Have a family member, friend, or loved one that can benefit from our Chropractic care? Use this for to refer them directyl into our office and we will take it from there.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        ), 
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Full Name",
                    style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        style: TextStyle(color: isDarkTheme ? Colors.black : Colors.white),
                        cursorColor: Colors.blue,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Email",
                    style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        style: TextStyle(color: isDarkTheme ? Colors.black : Colors.white),
                        cursorColor: Colors.blue,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Phone",
                    style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        style: TextStyle(color: isDarkTheme ? Colors.black : Colors.white),
                        cursorColor: Colors.blue,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                     Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              const Text(
                              'How would you like to refer them?',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: CheckboxListTile(
                                      title: const Text('Call my prospective directly',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
                                      value: checkboxes[0],
                                      controlAffinity: ListTileControlAffinity.leading,
                                      contentPadding: const EdgeInsets.only(left: 0),
                                      onChanged: (value) => ref.read(checkboxProvider.notifier).toggleCheckbox(0),
                                    ),
                                    ),
                                    SizedBox(
                                        height: 40,
                                        child: CheckboxListTile(
                                        title: const Text('Email or text my prespective patient',
                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
                                        value: checkboxes[1],
                                        controlAffinity: ListTileControlAffinity.leading,
                                        contentPadding: const EdgeInsets.only(left: 0),
                                        onChanged: (value) => ref.read(checkboxProvider.notifier).toggleCheckbox(1),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 40,
                                        child: CheckboxListTile(
                                        title: const Text('Bring my prospective patient to office',
                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
                                        value: checkboxes[2],
                                        controlAffinity: ListTileControlAffinity.leading,
                                        contentPadding: const EdgeInsets.only(left: 0),
                                        onChanged: (value) => ref.read(checkboxProvider.notifier).toggleCheckbox(2),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                        child: CheckboxListTile(
                                        title: const Text('Comments',
                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
                                        value: checkboxes[3],
                                        controlAffinity: ListTileControlAffinity.leading,
                                        contentPadding: const EdgeInsets.only(left: 0),
                                        onChanged: (value) => ref.read(checkboxProvider.notifier).toggleCheckbox(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          width: 340,
                          height: 55,
                          decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text('Refer Now  >',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
