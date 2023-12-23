import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final DateTime? initValue;
  final DateFieldController? controller;
  final Color color;
  final String label;
  final void Function(DateTime?)? onDateChanged;

  const DateField({
    super.key,
    this.initValue,
    this.color = Colors.blueAccent,
    this.onDateChanged,
    this.label = "",
    this.controller,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late final DateFieldController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = DateFieldController();
    }

    _controller.date ??= widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: TextField(
                controller: _controller._textController,
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
                  initialDate: _controller.date ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));

              if (pickedDate == null) {
                return;
              }

              _controller.date = pickedDate;

              if (widget.onDateChanged != null) {
                widget.onDateChanged!(_controller.date);
              }
            },
            color: widget.color,
            icon: const Icon(
              Icons.date_range,
            )),
        IconButton(
            onPressed: () {
              _controller.clear();

              if (widget.onDateChanged != null) {
                widget.onDateChanged!(null);
              }
            },
            color: widget.color,
            icon: Icon(
              Icons.close,
              color: widget.color,
            ))
      ],
    );
  }
}

class DateFieldController {
  late TextEditingController _textController;
  late final DateFormat _formatter;
  DateTime? _date;

  DateFieldController([this._date, String? format]) {
    _textController = TextEditingController();

    if (format != null) {
      _formatter = DateFormat(format);
    } else {
      _formatter = DateFormat("d/MMM/y");
    }
  }

  clear() {
    _date = null;
    _textController.text = _defaultDisplay;
  }

  set date(DateTime? value) {
    _date = value;
    _textController.text =
        _date == null ? _defaultDisplay : _formatter.format(_date!);
  }

  DateTime? get date => _date;

  String get _defaultDisplay {
    return "-" * _formatter.pattern!.length * 2;
  }
}
