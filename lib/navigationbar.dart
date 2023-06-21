import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:webspc/DTO/history.dart';
import 'package:webspc/resource/Home/View_hisbooking.dart';
import 'package:webspc/resource/Login&Register/login_page.dart';
import 'package:webspc/resource/Profile/car_detail_screen.dart';
import 'package:webspc/resource/Profile/car_register_screen.dart';
import 'package:webspc/resource/Profile/topup_page.dart';
import 'package:webspc/resource/Profile/userinfor_page.dart';
import 'DTO/cars.dart';
import 'DTO/section.dart';
import 'DTO/user.dart';
import 'resource/Home/home_page.dart';
import 'resource/Profile/account_page.dart';

Widget buildBottomNavigationBar(int _currentIndex, BuildContext context) {
  return NavigationDrawer(
    // iconSize: 30.0,
    // selectedColor: const Color.fromRGBO(20, 160, 240, 1.0),
    // strokeColor: const Color(0x30040307),
    // unSelectedColor: const Color(0xffacacac),
    // backgroundColor: Colors.white12,
    //  list: [
    //   CustomNavigationBarItem(
    //     icon: const Icon(Icons.home),
    //     title: const Text("Home"),
    //   ),
    //   CustomNavigationBarItem(
    //     icon: const Icon(Icons.account_circle),
    //     title: const Text("Profile"),
    //   ),
    // ],
    // currentIndex: _currentIndex,
    // onTap: (index) {
    //   if (index == _currentIndex) return;
    //   if (index == 0) {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const HomeScreen()));
    //   } else if (index == 1) {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const AccountPage()));
    //   }
    // },
    children: [
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.home_max_outlined),
        title: Text("Home"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen(context)));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.account_box),
        title: Text("Information Account"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserInforScreen()));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text("Information Car"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CarDetailScreen()));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.directions_car_outlined),
        title: Text("Register Car"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CarRegisterScreen()));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.money),
        title: Text("Top up"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TopupScreen(context)));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.history),
        title: Text("History"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewHistoryPage(context)));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: Text("Log out"),
        onTap: () {
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
      ),
    ],
  );
}
