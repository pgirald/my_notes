import 'package:flutter/material.dart';

class BarTools extends StatefulWidget {
  const BarTools({super.key});

  @override
  State<BarTools> createState() => _BarToolsState();
}

class _BarToolsState extends State<BarTools> {
  final _searchInputController = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    _searchInputController.addListener(_updateFilterText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Notes"),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                width: 200,
                height: 40,
                child: TextField(
                    controller: _searchInputController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Enter a search term",
                        filled: true,
                        fillColor: Colors.white))),
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.more_vert))
          ],
        ),
      ),
    ]);
  }

  void _updateFilterText() {
    //_filterParams.title = _searchInputController.text;
  }
}
