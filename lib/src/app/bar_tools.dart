import 'package:flutter/material.dart';
import 'package:my_notes/src/features/notes/src/data/notes_storage.dart';
import 'package:my_notes/utils/widgets/date_field.dart';

class BarTools extends StatefulWidget {
  final double iconsSize;

  final void Function(NotesFilterParams?)? onParamsChanged;

  const BarTools({super.key, this.onParamsChanged, this.iconsSize = 20});

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
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: _removeFilterRequested,
            icon: const Icon(Icons.cleaning_services),
            iconSize: widget.iconsSize,
          ),
          SizedBox(
              width: 180,
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
            icon: const Icon(Icons.search),
            iconSize: widget.iconsSize,
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            iconSize: widget.iconsSize,
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
    );
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
