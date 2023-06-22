import 'package:flutter/material.dart';
import 'package:webspc/Api_service/history_services.dart';
import 'package:webspc/DTO/history.dart';
import 'package:webspc/resource/Profile/topup_page.dart';
import 'package:webspc/resource/Profile/userinfor_page.dart';

import '../../DTO/cars.dart';
import '../../DTO/section.dart';
import '../../DTO/user.dart';
import '../Home/home_page.dart';
import '../Login&Register/login_page.dart';
import 'car_detail_screen.dart';
import 'car_register_screen.dart';

class ViewUserHistoryPage extends StatefulWidget {
  final BuildContext? context;

  const ViewUserHistoryPage(this.context, {Key? key}) : super(key: key);

  @override
  State<ViewUserHistoryPage> createState() => _ViewUserHistoryPageState();
}

class _ViewUserHistoryPageState extends State<ViewUserHistoryPage> {
  bool isLoading = true;
  List<History> listHistory = [];

  void getListHistory() {
    isLoading = false;
    HistoryService.getListHistory().then((value) {
      setState(() {
        listHistory = value;
      });
    });
  }

  @override
  void initState() {
    getListHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Row(children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(context)));
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserInforScreen()));
                    },
                    child: Text(
                      "Information Account",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarDetailScreen()));
                      },
                      child: Text(
                        "Information Car",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarRegisterScreen()));
                    },
                    child: Text(
                      "Register Car",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopupScreen(context)));
                    },
                    child: Text(
                      "Top up",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewUserHistoryPage(context)));
                    },
                    child: Text(
                      "History",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Do you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Session.loggedInUser = Users(userId: "0");
                                  Session.carUserInfor = Car();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen(context)),
                                    (route) => false,
                                  );
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  SizedBox(
                    width: 300,
                  )
                ]),
              )
            ],
            title: Text(
              " Smart Parking System",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
              )),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Your History",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listHistory.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              listHistory[index].carPlate ?? '',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Time in: ${DateTime.parse(listHistory[index].timeIn ?? '').toString().substring(0, 19)}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'Time out: ${DateTime.parse(listHistory[index].timeOut ?? '').toString().substring(0, 19)}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              'Amount',
                              semanticsLabel: listHistory[index].amount ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )));
    }
  }
}
