import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/crossword_generator_app.dart';             // Add this import

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Crossword Builder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        home: CrosswordGeneratorApp(),                     // Remove what was here and replace
      ),
    ),
  );
}