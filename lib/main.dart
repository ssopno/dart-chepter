import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
              Get.to(const SecondScreen());
              },
              child:const Text('Second screen'))
        ],
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back')),
          ElevatedButton(
              onPressed: () {
                Get.off(const ThirdScreen(), arguments: ['dhfjhf', 'hf']);
              },
              child: const Text('Third Screen')),
          ElevatedButton(
              onPressed: () {
                Get.offAll(const ThirdScreen(), predicate: (route) => false);
              },
              child: const Text('Third Screen with empty stack')),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
 const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Third Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back'))
        ],
      ),
    ) ;
  }
}



