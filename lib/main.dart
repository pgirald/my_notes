import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/app/home.dart';

void main() {
  runApp(const ProviderScope(child: MyNotes()));
}
