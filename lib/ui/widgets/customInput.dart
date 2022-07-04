import 'package:flutter/material.dart';
import '../../services/themeServces.dart';
import 'package:crudsqlite/ui/theme.dart';
import 'package:get/get.dart';

class MyCustomInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyCustomInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: labelStyles,
          ),
          Container(
            // ignore: sort_child_properties_last
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autocorrect: false,
                  autofocus: false,
                  cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  controller: controller,
                  style: inputtextStyles,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: inputtextStyles,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ]),
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 13),
            height: 52,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.1,
                ),
                borderRadius: BorderRadius.circular(12)),
          )
        ],
      ),
    );
  }
}
