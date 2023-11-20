import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/ui/home/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const CoreDI().setup(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick And Morty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
