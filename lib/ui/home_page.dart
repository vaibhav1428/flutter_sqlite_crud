import 'package:crudsqlite/ui/theme.dart';
import './widgets/adTaskbar.dart';
import './widgets/button.dart';

import '../services/notification_services.dart';
import 'package:flutter/material.dart';
import '../services/themeServces.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotificationHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(),
        body: Column(
          children: [
            _apptaskbar(),
            const SizedBox(
              height: 20,
            ),
            _addDateBar()
          ],
        ));
  }

  _apptaskbar() {
    return (Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(
            label: "+ Add Task",
            OnTap: () => Get.to(() => AddTaskPage()),
          )
        ],
      ),
    ));
  }

  _addDateBar() {
    return (Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    ));
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      title: const Center(
        child: Text(
          'Todo App',
        ),
      ),
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "theme changed",
            body: Get.isDarkMode
                ? "chnaged to bright mode "
                : "chnaged to bright mode",
          );
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
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
}
