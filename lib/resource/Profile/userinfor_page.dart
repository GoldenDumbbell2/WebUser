// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:webspc/Api_service/login_service.dart';
import 'package:webspc/DTO/cars.dart';
import 'package:webspc/DTO/section.dart';
import 'package:webspc/resource/Profile/spc_wallet_page.dart';
import 'package:webspc/resource/Profile/spot_screen.dart';
import 'package:webspc/resource/Profile/topup_page.dart';
import 'package:webspc/resource/Profile/view_history.dart';
import 'package:webspc/styles/button.dart';
import '../../Api_service/car_detail_service.dart';
import '../../Api_service/user_infor_service.dart';
import '../../DTO/user.dart';
import '../Home/View_hisbooking.dart';
import '../Home/home_page.dart';
import '../Login&Register/login_page.dart';
import 'car_detail_screen.dart';
import 'car_register_screen.dart';

class UserInforScreen extends StatefulWidget {
  static const routeName = '/userScreen';

  const UserInforScreen({super.key});

  @override
  UserInforPageState createState() => UserInforPageState();
}

class UserInforPageState extends State<UserInforScreen> {
  final RoundedLoadingButtonController _btnSave =
      RoundedLoadingButtonController();
  int selectedIndex = 0;
  int selectedCatIndex = 0;

  String? userId;
  String? textFiledPhone;
  List<Car> listCar = [];
  Car? carDetail;
  bool isLoading = true;

  @override
  void initState() {
    getListCar();
    super.initState();
  }

  void loading() {
    setState(() {
      isLoading = false;
      LoginService.update().then((value) => setState(
            () {},
          ));
    });
  }

  void getListCar() {
    CarDetailService.getListCar().then((response) => setState(() {
          isLoading = false;
          listCar = response;
          if (listCar.isNotEmpty) {
            carDetail = listCar.first;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      Size size = MediaQuery.of(context).size;
      var time = DateTime.now();
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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.15,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 930,
                        // right: 300,
                      ),
                      height: size.height * 0.2 - 1,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'images/user.png',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 680,
                width: 680,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Text(
                          'TRANSPORTATION INFORMATION',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          width: 350,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: carDetail == null ||
                                      carDetail?.carPaperFront == null ||
                                      carDetail?.carId == ""
                                  ? Image.asset(
                                      "images/carrr.png",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      carDetail!.carPaperFront!,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 60,
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listCar.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    carDetail = listCar[index];
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 60,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child:
                                        listCar[index].carPaperFront == null ||
                                                listCar[index].carId == ""
                                            ? Image.asset(
                                                "images/carrr.png",
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                listCar[index].carPaperFront!,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          '--------------------------------------------------------------------------------',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'USER INFORMATION',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {},
                            // padding: const EdgeInsets.all(0.0),
                            style: userstylebutton,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.email_sharp,
                                        color: Colors.black,
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        Session.loggedInUser.email!,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          style: userstylebutton,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.phone_android,
                                      color: Colors.black,
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(left: 50),
                                    child: Text(
                                      '${Session.loggedInUser.phoneNumber}',
                                      style: const TextStyle(
                                          fontSize: 20.0, color: Colors.black),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Text(
                                              'Please enter your phone number',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      'images/vietnam.png',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        border: Border(
                                                          left: BorderSide.none,
                                                          top: BorderSide.none,
                                                          right:
                                                              BorderSide.none,
                                                          bottom: BorderSide(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ),
                                                      child: TextField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            textFiledPhone =
                                                                value;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Phone number',
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 16,
                                                            vertical: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 60, right: 60),
                                              child: RoundedLoadingButton(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.055,
                                                color: const Color.fromRGBO(
                                                    20, 160, 240, 1.0),
                                                controller: _btnSave,
                                                onPressed: () {
                                                  if (textFiledPhone != null) {
                                                    Users user = Users(
                                                        userId: Session
                                                            .loggedInUser
                                                            .userId,
                                                        email: Session
                                                            .loggedInUser.email,
                                                        pass: Session
                                                            .loggedInUser.pass,
                                                        phoneNumber:
                                                            textFiledPhone
                                                                .toString(),
                                                        fullname: Session
                                                            .loggedInUser
                                                            .fullname,
                                                        identitiCard: Session
                                                            .loggedInUser
                                                            .identitiCard,
                                                        familyId: Session
                                                            .loggedInUser
                                                            .familyId,
                                                        wallet: Session
                                                            .loggedInUser
                                                            .wallet,
                                                        paymentStatus: Session
                                                            .loggedInUser
                                                            .paymentStatus,
                                                        familyVerify: Session
                                                            .loggedInUser
                                                            .familyVerify,
                                                        roleUser: Session
                                                            .loggedInUser
                                                            .roleUser);
                                                    UserInforService.updateUser(
                                                            user,
                                                            Session.loggedInUser
                                                                .userId!)
                                                        .then((value) =>
                                                            loading());
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Save",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextButton(
                            onPressed: null,
                            style: userstylebutton,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.account_box,
                                        color: Colors.black,
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        "${Session.loggedInUser.fullname}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextButton(
                            onPressed: null,
                            style: userstylebutton,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.perm_identity_sharp,
                                        color: Colors.black,
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        "${Session.loggedInUser.identitiCard}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
