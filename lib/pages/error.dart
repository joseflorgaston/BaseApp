import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.errorDetails}) : super(key: key);
  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text('Ha ocurrido un error ${errorDetails.context?.name}'),
      ),
    );
  }

}