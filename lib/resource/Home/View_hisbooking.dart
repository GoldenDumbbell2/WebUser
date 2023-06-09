import 'package:flutter/material.dart';
import 'package:webspc/Api_service/booking_services.dart';
import 'package:webspc/DTO/booking.dart';
import 'package:webspc/DTO/section.dart';
import 'package:webspc/styles/button.dart';

import '../../DTO/cars.dart';
import '../../DTO/user.dart';
import '../Login&Register/login_page.dart';
import '../Profile/car_detail_screen.dart';
import '../Profile/car_register_screen.dart';
import '../Profile/spc_wallet_page.dart';
import '../Profile/spot_screen.dart';
import '../Profile/topup_page.dart';
import '../Profile/userinfor_page.dart';
import '../Profile/view_history.dart';
import 'home_page.dart';

class ViewHistoryPage extends StatefulWidget {
  static const routerName = 'ViewHistoryPage';
  final BuildContext? context;

  const ViewHistoryPage(this.context, {Key? key}) : super(key: key);

  @override
  _ViewHistoryPage createState() => _ViewHistoryPage();
}

class _ViewHistoryPage extends State<ViewHistoryPage> {
  BuildContext? dialogContext;
  bool isLoading = true;
  List<Booking> listBooking = [];
  Booking? Bookingdetail;
  void getListBooking() {
    isLoading = false;
    BookingService.getListBooking().then((response) => setState(() {
          listBooking = response;
        }));
  }

  @override
  void initState() {
    super.initState();
    getListBooking();
    // this.fecthUser();
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
                              builder: (context) => SPCWalletScreen(context)));
                    },
                    child: Text(
                      "Sps Wallet",
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
                              builder: (context) => SpotScreen(context)));
                    },
                    child: Text(
                      "Buy Spot",
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
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
              )),
              // padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: Text(
                      "Your Booking",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: ListView.builder(
                          itemCount: listBooking.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: ${Session.loggedInUser.fullname!}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Car Color: ${listBooking[index].carColor}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'CarPlate: ${listBooking[index].carplate}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Spot: ${listBooking[index].sensorId}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${listBooking[index].dateTime}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            ElevatedButton(
                                                style: buttonvhis,
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      // barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        dialogContext = context;
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 800,
                                                                  right: 690,
                                                                  top: 200,
                                                                  bottom: 800),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      width:
                                                                          2.0,
                                                                      color: Color.fromARGB(
                                                                          100,
                                                                          161,
                                                                          125,
                                                                          17)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "Name:  ${Session.loggedInUser.fullname}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              24,
                                                                          decoration:
                                                                              TextDecoration.none,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "Spot:  ${listBooking[index].sensorId}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              24,
                                                                          decoration:
                                                                              TextDecoration.none,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "CarPlate:  ${listBooking[index].carplate}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              24,
                                                                          decoration:
                                                                              TextDecoration.none,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "CarColor:  ${listBooking[index].carColor}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              24,
                                                                          decoration:
                                                                              TextDecoration.none,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "Booking Time:  ${listBooking[index].dateTime}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              24,
                                                                          decoration:
                                                                              TextDecoration.none,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    ElevatedButton(
                                                                      style:
                                                                          buttonDelete,
                                                                      onPressed:
                                                                          () {
                                                                        showDialog<
                                                                            String>(
                                                                          context:
                                                                              context,
                                                                          builder: (BuildContext context) =>
                                                                              AlertDialog(
                                                                            title:
                                                                                const Text('Do you want to DELETE your booking?'),
                                                                            actions: <Widget>[
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(context),
                                                                                child: const Text('No'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  BookingService.DeleteBooking(listBooking[index].bookingId!).then((value) => getListBooking());
                                                                                  Navigator.pop(context);
                                                                                  Navigator.pop(dialogContext!);
                                                                                },
                                                                                child: const Text('Yes'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                      child: Text(
                                                                          "Delete"),
                                                                    ),
                                                                  ])),
                                                        );
                                                      });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Center(
                                                    child: Text("View"),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }))
                ],
              )));
    }
  }
}
