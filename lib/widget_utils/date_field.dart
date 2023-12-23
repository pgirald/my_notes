import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final String? format;
  final DateTime? initValue;
  final Color color;
  final String label;
  final void Function(DateTime?)? onDateChanged;

  const DateField({
    super.key,
    this.format,
    this.initValue,
    this.color = Colors.blueAccent,
    this.onDateChanged,
    this.label = "",
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late final DateFormat _formatter;
  final _dateInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.format != null) {
      _formatter = DateFormat(widget.format);
    } else {
      _formatter = DateFormat("d/MMM/y");
    }
    if (widget.initValue != null) {
      _formatter.format(widget.initValue!);
    } else {
      _defaultDisplay;
    }
    _dateInputController.text = _defaultDisplay;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: TextField(
                controller: _dateInputController,
                enabled: false,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    label: Text(widget.label),
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: "Enter a search term",
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.color),
                    ))),
          ),
        ),
        IconButton(
            onPressed: () async {
              var pickedDate = await showDatePicker(
                  context: context,
                  initialDate: widget.initValue ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if (pickedDate == null) {
                return;
              }

              _dateInputController.text = _formatter.format(pickedDate);
              if (widget.onDateChanged != null) {
                widget.onDateChanged!(pickedDate);
              }
            },
            color: widget.color,
            icon: const Icon(
              Icons.date_range,
            )),
        IconButton(
            onPressed: () {
              if (widget.onDateChanged != null) {
                widget.onDateChanged!(null);
              }
              _dateInputController.text = _defaultDisplay;
            },
            color: widget.color,
            icon: Icon(
              Icons.close,
              color: widget.color,
            ))
      ],
    );
  }

  String get _defaultDisplay {
    return "-" * _formatter.pattern!.length * 2;
  }
}
