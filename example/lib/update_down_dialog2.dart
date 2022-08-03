import 'dart:async';

import 'package:flutter/material.dart';

class UpdateDownDialog2 extends StatefulWidget {
  static showUpdateDowningDialog(
      BuildContext context, ValueNotifier<double> valueNotifier, VoidCallback sureCallback) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              child: UpdateDownDialog2(
                valueNotifier,
                sureCallback,
              ),
              onWillPop: _onWillPop);
        });
  }

  static Future<bool> _onWillPop() async {
    return true;
  }

  final ValueNotifier<double> valueNotifier;
  final VoidCallback sureCallBack;

  UpdateDownDialog2(this.valueNotifier, this.sureCallBack, {Key? key}) : super(key: key);

  @override
  _UpdateDownDialogState createState() => _UpdateDownDialogState();
}

class _UpdateDownDialogState extends State<UpdateDownDialog2> {
  int downloadProgress = 0;

  ValueNotifier<double> get _valueNotifier => widget.valueNotifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('标题'),
            SizedBox(height: 16),
            Text('内容内容内容内容内容内容内容内容内容'),
            SizedBox(height: 16),
            ValueListenableBuilder<double>(
                valueListenable: _valueNotifier,
                builder: (context, value, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: LinearProgressIndicator(
                      value: value,
                      backgroundColor: Color(0xFF7E7F88).withOpacity(0.15),
                      minHeight: 20,
                      // color: Color(0xFFFD785D),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFD785D)),
                    ),
                  );
                }),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.sureCallBack.call();
              },
              child: Text('下载'),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
