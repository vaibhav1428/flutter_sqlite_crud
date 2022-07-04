// ignore: depend_on_referenced_packages
import 'package:crudsqlite/ui/theme.dart';
import '../widgets/customInput.dart';
import '../widgets/button.dart';
import '../../services/notification_services.dart';
import 'package:flutter/material.dart';
import '../../services/themeServces.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selecteddate = DateTime.now();
  String _endtime = "9:30 PM";
  String _starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 2, 3, 4, 20];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              MyCustomInputField(title: "Title", hint: "Enter Title"),
              MyCustomInputField(title: "Note", hint: "Enter Note"),
              MyCustomInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selecteddate),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getdatefromuser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyCustomInputField(
                    title: "start date",
                    hint: _starttime,
                    widget: IconButton(
                        onPressed: () {
                          _getTimePicker(isStarttime: true);
                        },
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        )),
                  )),
                  Expanded(
                    child: MyCustomInputField(
                      title: "End date",
                      hint: _endtime,
                      widget: IconButton(
                          onPressed: () {
                            _getTimePicker(isStarttime: false);
                          },
                          icon: const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ],
              ),
              MyCustomInputField(
                  title: "Remond",
                  hint: '$_selectedRemind min early',
                  widget: DropdownButton(
                    underline: Container(height: 0),
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()));
                    }).toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: inputtextStyles,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRemind = int.parse(value!);
                      });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      title: const Center(
        child: Text(
          'Add Task',
        ),
      ),
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.white,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/avatar.png"),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _showtimepicker() {
    return showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(
          hour: int.parse(_starttime.split(":")[0]),
          minute: int.parse(_starttime.split(":")[1].split(" ")[0])),
    );
  }

  _getTimePicker({required bool isStarttime}) async {
    var _pickedtime = await _showtimepicker();
    String _forattedtime = _pickedtime.format(context);
    if (_pickedtime == null) {
      print("time cancled");
    } else if (isStarttime == true) {
      setState(() {
        _starttime = _forattedtime;
      });
    } else if (isStarttime == false) {
      setState(() {
        _endtime = _forattedtime;
      });
    }
  }

  _getdatefromuser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2023),
    );

    if (_pickerDate != null) {
      setState(() {
        _selecteddate = _pickerDate;
      });
    }
  }
}
