import 'package:flutter/material.dart';
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/widget_utils/date_field.dart';

class BarTools extends StatefulWidget {
  final void Function(NotesFilterParams?)? onParamsChanged;

  const BarTools({super.key, this.onParamsChanged});

  @override
  State<BarTools> createState() => _BarToolsState();
}

class _BarToolsState extends State<BarTools> {
  final _searchInputController = TextEditingController();

  final DateFieldController _lowerDateController = DateFieldController();
  final DateFieldController _upperDateController = DateFieldController();

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
            IconButton(
                onPressed: _removeFilterRequested,
                icon: const Icon(Icons.cleaning_services)),
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
                  _notifyParamsChange((
                    lowerDate: _lowerDateController.date,
                    upperDate: _upperDateController.date,
                    title: _searchInputController.text
                  ));
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
                    controller: _lowerDateController,
                    label: "Lower date",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DateField(
                      controller: _upperDateController, label: "Upper date"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _notifyParamsChange((
                      lowerDate: _lowerDateController.date,
                      upperDate: _upperDateController.date,
                      title: _searchInputController.text
                    ));
                    Navigator.of(context).pop();
                  },
                  child: const Text("Filter"))
            ],
          ));

  void _notifyParamsChange(NotesFilterParams? params) {
    if (widget.onParamsChanged == null) {
      return;
    }
    widget.onParamsChanged!(params);
  }

  void _removeFilterRequested() {
    _searchInputController.clear();
    _lowerDateController.clear();
    _upperDateController.clear();
    _notifyParamsChange(null);
  }
}
