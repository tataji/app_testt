import 'package:app_tesst/model/EmployeesModel.dart';
import 'package:app_tesst/ui/EmployeeDetailsPage.dart';
import 'package:app_tesst/utils/SQLiteDatabaseProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tip_dialog/tip_dialog.dart';

class EmployeeListPage extends StatefulWidget {
  EmployeeListPage() : super();
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  List<Employee> employeeList = new List();
  double width;
  double height;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///creating the app db
    if(SQLiteDatabaseProvider.db!=null) {
      SQLiteDatabaseProvider.db.getDatabaseInstance();
    }
    getEmployeeList();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10,bottom:20.0),
                  child: GestureDetector(onTap: (){
                    getEmployeeList();
                  },
                      child: Text("Employee list",style: TextStyle(fontSize: 20),)),
                ),
                Container(height: MediaQuery.of(context).size.height/1.4,
                  child: employeeList.isEmpty?Container():ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: employeeList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetailsPage(employee: employeeList[index],),
                          ),
                        );
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container( width: width,
                            height: height/8,
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a181818),
                                    offset: Offset(0, 1),
                                    blurRadius: 25,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Employee Name: ${employeeList[index].firstName}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Employee Email: ${employeeList[index].email}'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: TipDialogContainer(duration: const Duration(seconds: 2)),
          ),
        ],
      ),
    );
  }

  Future<String> getEmployeeList() async {
    List<Employee> localDbEmployeeList = await SQLiteDatabaseProvider.db.getAllEmployeeListStoredLocalDb();
    if(localDbEmployeeList.isEmpty) {
      ///local db is empty, so call data from network
      var response = await http.get(
          Uri.encodeFull(
              "https://gorest.co.in/public-api/users?_format=json&access-token=9Qa3aV_GPDl_ABOM6_Bw_LSdXjy8HvefOBBz"),
          headers: {
            "Accept": "application/json"
          }
      );
      EmloyeesModel emloyeesModel = EmloyeesModel.fromJson(
          json.decode(response.body));
      if(emloyeesModel.mMeta.success) {
        print(emloyeesModel.mMeta.message);
        setState(() {
          employeeList = emloyeesModel.employee;
        });
        insertEmployeeToSQLiteData();
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(emloyeesModel.mMeta.message),
        ));
      }
    }else{
      ///return the local db employee list
      print(localDbEmployeeList);
      setState(() {
        employeeList = localDbEmployeeList;
      });
    }
    return "Success!";
  }
  void insertEmployeeToSQLiteData() async {
    for (int i = 0; i < employeeList.length; i++) {
      await SQLiteDatabaseProvider.db
          .addEmployeeToDatabase(employeeList[i]);
    }
  }
}