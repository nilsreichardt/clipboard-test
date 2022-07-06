import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter app'),
          backgroundColor: const Color.fromARGB(255, 32, 37, 40),
        ),
        body: const Center(child: Text('Hello world!')),
        floatingActionButton: const _FAB(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _FAB extends StatefulWidget {
  const _FAB();

  @override
  State<_FAB> createState() => _FABState();
}

class _FABState extends State<_FAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Clipboard.setData(const ClipboardData(text: 'Hello world!'));

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Copied to clipboard!')));
      },
      backgroundColor: Colors.yellow[700],
      child: const Icon(Icons.electric_bolt),
    );
  }
}
