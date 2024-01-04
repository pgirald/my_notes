import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/utils/riverpod/content_config.dart';

class ContentWraper<T> extends StatelessWidget {
  final AsyncValue<T> _content;
  final Widget Function(BuildContext context, T content) builder;
  final Widget Function(BuildContext context, AsyncError error)? errorBuilder;
  final ProgressIndicator? progressIndicator;

  const ContentWraper(
      {super.key,
      required this.builder,
      required AsyncValue<T> content,
      this.progressIndicator,
      this.errorBuilder})
      : _content = content;

  @override
  Widget build(BuildContext context) {
    return switch (_content) {
      AsyncData(value: final content) => builder(context, content),
      AsyncError content => errorBuilder == null
          ? Text(ContentConfig.errorMsg)
          : errorBuilder!(context, content),
      _ => progressIndicator ?? const CircularProgressIndicator(),
    };
  }
}
