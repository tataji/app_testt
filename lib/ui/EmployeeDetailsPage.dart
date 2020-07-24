import 'dart:async';
import 'package:app_tesst/model/EmployeesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final Employee employee;
  EmployeeDetailsPage({@required this.employee}) : super();
  @override
  _EmployeeDetailsPageState createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  double width;
  double height;
  Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            Navigator.pop(context);
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$_start',style: TextStyle(fontSize: 20),),
            ),
            Container(width: width,
              height: height/3,
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a181818),
                      offset: Offset(0, 1),
                      blurRadius: 25,
                      spreadRadius: 0)
                ],),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Text('Employee ID: ${widget.employee.id}'),
                 ),
                Divider(height: 1,color: Colors.black,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Employee DOB: ${widget.employee.dob}'),
                ),
                  Divider(height: 1,color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Employee Address: ${widget.employee.address}')
                  ),
              ],),
            )
          ],
        ),
      ),
    );
  }

}