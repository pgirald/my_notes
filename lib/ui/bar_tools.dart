import 'package:flutter/material.dart';
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/widget_utils/date_field.dart';

class BarTools extends StatefulWidget {
  final void Function(NotesFilterParams)? onFilterRequested;

  const BarTools({super.key, this.onFilterRequested});

  @override
  State<BarTools> createState() => _BarToolsState();
}

class _BarToolsState extends State<BarTools> {
  final _searchInputController = TextEditingController();

  DateTime? _lowerDate, _upperDate;

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
                key: const Key("searchButton"),
                onPressed: () {
                  _notifyFilterRequest(null, null, _searchInputController.text);
                },
                color: Colors.white,
                icon: const Icon(Icons.search)),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              color: Colors.white,
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                    onTap: _showFilerDialog,
                    child: const Text("Advanced search")),
                const PopupMenuItem(child: Text("Theme"))
              ],
            )
          ],
        ),
      ),
    ]);
  }

  void _updateFilterText() {
    //_filterParams.title = _searchInputController.text;
  }

  Future<void> _showFilerDialog() async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              children: //[]
                  [
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: _searchInputController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "Enter a search term",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DateField(
                      label: "Upper date", onDateChanged: _setUpperDate),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DateField(
                    label: "Lower date",
                    onDateChanged: _setLowerDate,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _notifyFilterRequest(
                        _lowerDate, _upperDate, _searchInputController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Filter"))
            ],
          ));

  void _setLowerDate(DateTime? date) {
    _lowerDate = date;
  }

  void _setUpperDate(DateTime? date) {
    _upperDate = date;
  }

  void _notifyFilterRequest(
      DateTime? lowerDate, DateTime? upperDate, String title) {
    if (widget.onFilterRequested == null) {
      return;
    }
    widget.onFilterRequested!(
        (lowerDate: lowerDate, upperDate: upperDate, title: title));
  }
}
