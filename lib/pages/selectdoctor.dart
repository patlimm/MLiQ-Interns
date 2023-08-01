import 'package:flutter/material.dart';

class Selectdoctor extends StatelessWidget {
  const Selectdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Image.asset('lib/assets/logo.png'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 18, right: 15),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Select a Doctor',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 100,
            height: 40,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Robin Broff'),
            ),
          ),
          Container(
            width: 100,
            height: 40,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Nicholas Chen'),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('Save Changes >'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
