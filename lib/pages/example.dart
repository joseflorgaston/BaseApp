import 'package:base_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Get.to(
                  () => const MyHomePage(),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 350),
                );
              },
              child: const Text(
                'Ir a pagina de inicio',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
