import 'package:flutter/material.dart';
import 'package:my_notes/ui/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyNotes()));
}
