import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:webspc/Api_service/user_infor_service.dart';
import 'package:webspc/resource/Home/Parking_spot.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:webspc/resource/Home/BookingScreen.dart';
import 'package:webspc/resource/Home/View_hisbooking.dart';
import 'package:webspc/resource/Profile/view_history.dart';
import 'package:webspc/styles/button.dart';
import '../../Api_service/car_detail_service.dart';
import '../../DTO/cars.dart';
import '../../DTO/section.dart';
import 'dart:math';

import '../../DTO/user.dart';
import '../Login&Register/login_page.dart';
import '../Profile/car_detail_screen.dart';
import '../Profile/car_register_screen.dart';
import '../Profile/topup_page.dart';
import '../Profile/userinfor_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  final BuildContext context;
  const HomeScreen(this.context);

  // const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  String? Codesecurity;
  String? code = '';
  int selectedIndex = 0;
  int selectedCatIndex = 0;
  List<Car> listCar = [];
  Car? carDetail;
  Car? dropdownValue;
  String? Carplate;

  List imageList = [
    {"id": 1, "image_path": 'images/slider2.jpg'},
    {"id": 2, "image_path": 'images/slider.jpg'},
    {"id": 3, "image_path": 'images/slider3.jpg'}
    // {"id": 2, "image_path": 'assets/images/bestsellersbanner.png'},
    // {"id": 3, "image_path": 'assets/images/banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  void initState() {
    getListCar();
    getCarUserInfor();
    super.initState();
  }

  void getCarUserInfor() {
    CarInforofUserService.carUserInfor().then((value) => setState(() {}));
    Carplate = Session.carUserInfor.carPlate;
  }

  void getListCar() {
    CarDetailService.getListCar().then((response) => setState(() {
          listCar = response;
        }));
  }

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('yyyy-MM-dd  kk:mm').format(now);

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
                          builder: (context) => ViewUserHistoryPage(context)));
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
                                    builder: (context) => LoginScreen(context)),
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
      // drawer: NavigationDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 1200,
              width: 600,
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,

                        // height: double.maxFinite,
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(top: 20),
                  child: Row(children: [
                    Image(image: AssetImage('images/iconsy.png')),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_sharp,
                          color: Color.fromARGB(100, 161, 125, 17),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Hello, ${Session.loggedInUser.fullname ?? ""}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                    SizedBox(
                      width: 130,
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.pushNamed(
                    //           context, ViewHistoryPage.routerName);
                    //     },
                    //     child: Icon(
                    //       Icons.book_online_sharp,
                    //       size: 40,
                    //       color: Color.fromARGB(255, 165, 110, 7),
                    //     )),
                    Container(
                      height: 50,
                      width: 390,
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 143, 146, 146).withOpacity(0.4),
                        border: Border.all(color: Colors.black38, width: 3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding: EdgeInsets.only(left: 50),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<Car>(
                                        alignment: Alignment.center,
                                        dropdownColor:
                                            Color.fromARGB(255, 143, 146, 146),
                                        underline: Container(),
                                        borderRadius: BorderRadius.circular(30),
                                        hint: const Text(
                                          'Today, What car you use?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // icon: Image.asset('images/carrr.png'),
                                        // iconSize: 45,
                                        onChanged: (Car? newvalue) {
                                          setState(() {
                                            dropdownValue = newvalue!;
                                          });
                                        },
                                        value: dropdownValue,
                                        items: listCar
                                            .map<DropdownMenuItem<Car>>(
                                                (Car value) {
                                          return DropdownMenuItem<Car>(
                                              value: value,
                                              // child: Text('${value.carPlate}'),
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                        child: Icon(
                                                      Icons
                                                          .directions_car_sharp,
                                                      size: 30,
                                                    )),
                                                    TextSpan(
                                                        text:
                                                            '          ${value.carPlate}'),
                                                  ],
                                                ),
                                              ));
                                        }).toList(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        elevation: 8,
                                        isExpanded: true,
                                      ),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  ]),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
                      style: TextStyle(
                          decoration: TextDecoration.none, color: Colors.white),
                    )),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.cyanAccent,
                  // ),
                  height: 50,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 200,
                      width: 900,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromARGB(100, 161, 125, 17)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text('Balance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                ),
                Column(),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      style: buttonPrimary,
                      onPressed: () {
                        Navigator.pushNamed(context, Booking1Screen.routerName);
                      },
                      icon: Icon(
                        Icons.book_online,
                        size: 50,
                      ),
                      label: Text(
                        'BOOKING',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      style: buttonPrimary,
                      onPressed: () {
                        Navigator.pushNamed(context, viewSpotPage.routerName);
                      },
                      icon: Icon(
                        Icons.directions_car_outlined,
                        size: 50,
                      ),
                      label: Text(
                        'CHECK SPOT',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      style: buttonPrimary,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ViewHistoryPage.routerName);
                      },
                      icon: Icon(
                        Icons.history_edu,
                        size: 50,
                      ),
                      label: Text('YOUR BOOKING',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      style: buttonPrimary,
                      onPressed: () {
                        setState(() {
                          code = dropdownValue?.carPlate;
                          var rng = Random();
                          for (var i = 100000; i < 1000000; i++) {
                            Codesecurity = rng.nextInt(1000000).toString();
                            break;
                          }

                          DateTime now = DateTime.now();
                          String formattedDate =
                              DateFormat('yyyy-MM-dd – kk:mm').format(now);
                        });
                        if (dropdownValue?.carPlate == null) {
                          showDialog(
                              context: context,
                              builder: (context) => Form(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 790,
                                        right: 790,
                                        top: 500,
                                        bottom: 500),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 9, top: 30),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          border: Border.all(
                                              width: 2.0,
                                              color: Color.fromARGB(
                                                  100, 161, 125, 17)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        "Please choose your car!",
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration: TextDecoration.none,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )));
                        } else if (dropdownValue?.verifyState1 == null ||
                            dropdownValue?.verifyState1 == false) {
                          showDialog(
                              context: context,
                              builder: (context) => Form(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 790,
                                        right: 790,
                                        top: 500,
                                        bottom: 500),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 9),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          border: Border.all(
                                              width: 2.0,
                                              color: Color.fromARGB(
                                                  100, 161, 125, 17)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        "*Your car is not authenticated state 1!\n*Please waiting for admin to authenticated state 1",
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration: TextDecoration.none,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => Form(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 800,
                                          right: 800,
                                          top: 150,
                                          bottom: 600),
                                      child: Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: Color.fromARGB(
                                                      100, 161, 125, 17)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              const Text('Your QR Code',
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                child: Text(
                                                    'Please present your QR code to the parking lot',
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.grey,
                                                      fontSize: 8,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              code == ''
                                                  ? Text('')
                                                  : BarcodeWidget(
                                                      barcode: Barcode.qrCode(
                                                        errorCorrectLevel:
                                                            BarcodeQRCorrectionLevel
                                                                .high,
                                                      ),
                                                      data:
                                                          'carplate: ${dropdownValue?.carPlate} \ntime: $currentTime \nHint code: $Codesecurity',
                                                      width: 200,
                                                      height: 200,
                                                    ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  left: 80,
                                                  // right: 60,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'images/carrr.png',
                                                      fit: BoxFit.cover,
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Text(
                                                        '${dropdownValue?.carPlate}',
                                                        style: const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Container(
                                                height: 50,
                                                width: 250,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        width: 3.0,
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Time In',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "${now}",
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              26,
                                                              145,
                                                              243)),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ));
                        }
                        ;
                      },
                      icon: Icon(
                        Icons.qr_code,
                        size: 50,
                      ),
                      label: Text('GENERATE QR',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
      //     BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
      //   ]),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         code = dropdownValue?.carPlate;
      //         var rng = Random();
      //         for (var i = 100000; i < 1000000; i++) {
      //           Codesecurity = rng.nextInt(1000000).toString();
      //           break;
      //         }

      //         DateTime now = DateTime.now();
      //         String formattedDate =
      //             DateFormat('yyyy-MM-dd – kk:mm').format(now);
      //       });
      //       if (dropdownValue?.carPlate == null) {
      //         showDialog(
      //             context: context,
      //             builder: (context) => Form(
      //                     child: Padding(
      //                   padding: const EdgeInsets.only(
      //                       left: 60, right: 60, top: 350, bottom: 400),
      //                   child: Container(
      //                     padding: EdgeInsets.only(left: 9, top: 30),
      //                     decoration: BoxDecoration(
      //                         color: Colors.white.withOpacity(0.8),
      //                         border: Border.all(
      //                             width: 2.0,
      //                             color: Color.fromARGB(100, 161, 125, 17)),
      //                         borderRadius: BorderRadius.circular(10)),
      //                     child: const Text(
      //                       "Please choose your car!",
      //                       style: TextStyle(
      //                           fontSize: 20,
      //                           decoration: TextDecoration.none,
      //                           color: Colors.black),
      //                     ),
      //                   ),
      //                 )));
      //       } else if (dropdownValue?.verifyState1 == null ||
      //           dropdownValue?.verifyState1 == false) {
      //         showDialog(
      //             context: context,
      //             builder: (context) => Form(
      //                     child: Padding(
      //                   padding: const EdgeInsets.only(
      //                       left: 40, right: 40, top: 350, bottom: 390),
      //                   child: Container(
      //                     padding: EdgeInsets.only(left: 9),
      //                     decoration: BoxDecoration(
      //                         color: Colors.white.withOpacity(0.8),
      //                         border: Border.all(
      //                             width: 2.0,
      //                             color: Color.fromARGB(100, 161, 125, 17)),
      //                         borderRadius: BorderRadius.circular(10)),
      //                     child: const Text(
      //                       "*Your car is not authenticated state 1!\n*Please waiting for admin to authenticated state 1",
      //                       style: TextStyle(
      //                           fontSize: 20,
      //                           decoration: TextDecoration.none,
      //                           color: Colors.black),
      //                     ),
      //                   ),
      //                 )));
      //       } else {
      //         showDialog(
      //             context: context,
      //             builder: (context) => Form(
      //                     child: Padding(
      //                   padding: const EdgeInsets.only(
      //                       left: 60, right: 60, top: 150, bottom: 200),
      //                   child: Container(
      //                       height: 5,
      //                       width: 5,
      //                       decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           border: Border.all(
      //                               width: 2.0,
      //                               color: Color.fromARGB(100, 161, 125, 17)),
      //                           borderRadius: BorderRadius.circular(10)),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           SizedBox(
      //                             height: 30,
      //                           ),
      //                           const Text('Your QR Code',
      //                               style: TextStyle(
      //                                   decoration: TextDecoration.none,
      //                                   color: Colors.black,
      //                                   fontSize: 30,
      //                                   fontWeight: FontWeight.bold)),
      //                           SizedBox(
      //                             height: 10,
      //                           ),
      //                           Container(
      //                             padding: EdgeInsets.only(
      //                               left: 20,
      //                               right: 20,
      //                             ),
      //                             child: Text(
      //                                 'Please present your QR code to the parking lot',
      //                                 style: TextStyle(
      //                                   decoration: TextDecoration.none,
      //                                   color: Colors.grey,
      //                                   fontSize: 8,
      //                                 )),
      //                           ),
      //                           SizedBox(
      //                             height: 30,
      //                           ),
      //                           code == ''
      //                               ? Text('')
      //                               : BarcodeWidget(
      //                                   barcode: Barcode.qrCode(
      //                                     errorCorrectLevel:
      //                                         BarcodeQRCorrectionLevel.high,
      //                                   ),
      //                                   data:
      //                                       'carplate: ${dropdownValue?.carPlate} \ntime: $currentTime \nHint code: $Codesecurity',
      //                                   width: 200,
      //                                   height: 200,
      //                                 ),
      //                           SizedBox(
      //                             height: 30,
      //                           ),
      //                           Container(
      //                             padding: EdgeInsets.only(
      //                               left: 60,
      //                               // right: 60,
      //                             ),
      //                             child: Row(
      //                               children: <Widget>[
      //                                 Image.asset(
      //                                   'images/carrr.png',
      //                                   fit: BoxFit.cover,
      //                                   width: 30,
      //                                   height: 30,
      //                                 ),
      //                                 SizedBox(
      //                                   width: 10,
      //                                 ),
      //                                 Text('${dropdownValue?.carPlate}',
      //                                     style: const TextStyle(
      //                                         decoration: TextDecoration.none,
      //                                         color: Colors.black,
      //                                         fontWeight: FontWeight.bold,
      //                                         fontSize: 20)),
      //                               ],
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             height: 30,
      //                           ),
      //                           Container(
      //                             height: 50,
      //                             width: 250,
      //                             decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 border: Border.all(
      //                                     width: 3.0, color: Colors.blue),
      //                                 borderRadius: BorderRadius.circular(5)),
      //                             child: Column(
      //                               children: [
      //                                 Text(
      //                                   'Time In',
      //                                   style: TextStyle(
      //                                       decoration: TextDecoration.none,
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Colors.black),
      //                                 ),
      //                                 Text(
      //                                   "${now}",
      //                                   style: TextStyle(
      //                                       decoration: TextDecoration.none,
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Color.fromARGB(
      //                                           255, 26, 145, 243)),
      //                                 )
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       )),
      //                 )));
      //       }
      //       ;
      //     },
      //     child: const Icon(Icons.qr_code),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
