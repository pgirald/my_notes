import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/ui/home.dart';

void main() {
  runApp(const ProviderScope(child: MyNotes()));
}
