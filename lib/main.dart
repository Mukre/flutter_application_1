import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view_models/app_view_model.dart';
import 'package:flutter_application_1/views/add_task_view.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 111, 108, 117)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

