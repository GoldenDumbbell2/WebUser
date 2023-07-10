import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:webspc/DTO/section.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../Api_service/vnpay_service.dart';
import '../../DTO/cars.dart';
import '../../DTO/user.dart';
import '../../payment/vnpay_web_view.dart';
import '../Home/home_page.dart';
import '../Login&Register/login_page.dart';
import 'car_detail_screen.dart';
import 'car_register_screen.dart';
import 'spot_screen.dart';
import 'userinfor_page.dart';
import 'view_history.dart';

class SPCWalletScreen extends StatefulWidget {
  final BuildContext context;

  // ignore: use_key_in_widget_constructors
  const SPCWalletScreen(this.context);

  @override
  SPCWalletScreenState createState() => SPCWalletScreenState();
}

class SPCWalletScreenState extends State<SPCWalletScreen> {
  final RoundedLoadingButtonController _btnLogin =
      RoundedLoadingButtonController();
  final TextEditingController controller = TextEditingController();
  late double wallet;
  String password = "";
  String currentPassword = Session.loggedInUser.pass!;

// Format currency vietnam dong
  String formatCurrency(double n) {
    // Add comma to separate thousands
    var currency = NumberFormat("#,##0", "vi_VN");
    return currency.format(n);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      wallet = Session.loggedInUser.wallet ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 770,
                width: 390,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'SPS Wallet',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 110,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromARGB(100, 161, 125, 17)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Wallet Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              formatCurrency(wallet) + ' VNĐ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 340,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Deposit amount (VNĐ)',
                          // suffixIcon: Icon(FontAwesomeIcons.envelope,size: 17,),
                        ),
                        // onChanged: (value) => controller.text = value,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '----------  Or choose amount  ----------',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //   margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('100.000đ',
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              controller.text = '100000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          //  margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('200.000đ',
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              controller.text = '200000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          //  margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('500.000đ',
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              controller.text = '500000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //   margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('1.000.000đ',
                                style: TextStyle(fontSize: 17)),
                            onPressed: () {
                              controller.text = '1000000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          //  margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('2.000.000đ',
                                style: TextStyle(fontSize: 17)),
                            onPressed: () {
                              controller.text = '2000000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          //  margin: EdgeInsets.only(left: 0, right: 200),
                          child: OutlinedButton(
                            child: Text('5.000.000đ',
                                style: TextStyle(fontSize: 17)),
                            onPressed: () {
                              controller.text = '5000000';
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: RoundedLoadingButton(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.055,
                        child: Text("Top up via VNPay",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        color: const Color.fromRGBO(20, 160, 240, 1.0),
                        controller: _btnLogin,
                        onPressed: _onLoginPress,
                        borderRadius: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLoginPress() async {
    // Check if amount is null or 0
    if (controller.text.isEmpty ||
        controller.text == '' ||
        controller.text == '0' ||
        double.parse(controller.text) < 0) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter amount'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                )
              ],
            );
          });
      _btnLogin.reset();
      return;
    }
    showDialog(context: context, builder: _dialogCheckPassword);
    _btnLogin.reset();
  }

  AlertDialog _dialogCheckPassword(BuildContext context) {
    return AlertDialog(
      title: Text("Enter you password to confirm"),
      content: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (password == currentPassword) {
              Navigator.of(context).pop();
              final paymentUrl = VNPayService.generatePaymentUrl(
                orderInfo: "Top up wallet",
                amount: double.parse(controller.text),
              );
              print(paymentUrl);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VnPaymentWebViewScreen(url: paymentUrl),
                ),
              );
            } else {
              _showMyDialog(context, "Wrong password", "Please try again");
            }
          },
          child: Text("Ok"),
        ),
      ],
    );
  }

  Future _showMyDialog(
      BuildContext context, String title, String description) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
