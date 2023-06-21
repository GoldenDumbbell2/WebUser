import 'package:flutter/material.dart';
import 'package:webspc/resource/Home/home_page.dart';
import 'package:webspc/styles/button.dart';
import '../../Api_service/spot_service.dart';
import '../../DTO/spot.dart';

class viewSpotPage extends StatefulWidget {
  static const routerName = 'ViewSpotPage';
  final BuildContext? context;

  const viewSpotPage(this.context, {Key? key}) : super(key: key);

  @override
  _ViewSpotState createState() => _ViewSpotState();
}

class _ViewSpotState extends State<viewSpotPage> {
  bool isLoading = true;
  List<Spot> listSpot = [];
  Spot? detailSpot;

  void getAllListSpot() {
    SpotDetailService.getAllListSpot().then((response) => setState(() {
          isLoading = false;
          listSpot = response;
          if (listSpot.isNotEmpty) {
            detailSpot = listSpot.first;
          }
        }));
  }

  @override
  void initState() {
    getAllListSpot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        backgroundColor: Color(0xfffbf9f9),
        appBar: AppBar(
          elevation: 4,
          // centerTitle: false,
          // automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3a57e8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            "Parking Spot (S101 Floor 1)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24),
            color: Color(0xff212435),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen(context)));
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 10),
              height: 1100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0x1f000000),
                // shape: BoxShape.rectangle,
                // borderRadius: BorderRadius.zero,
                // border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[6].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[6].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[6].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        listSpot[10].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[10].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[10].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        listSpot[17].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[17].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[17].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[5].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[5].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[5].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        listSpot[9].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[9].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[9].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 50,
                        ),
                        listSpot[16].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[16].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[16].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[4].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[4].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[4].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 200,
                        ),
                        listSpot[15].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[15].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[15].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[3].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[3].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[3].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0x1f000000),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Align(
                            alignment: Alignment(-0.1, 0.0),
                            child: Text(
                              "Elevator",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        listSpot[14].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[14].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[14].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[2].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[2].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[2].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 200,
                        ),
                        listSpot[13].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[13].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[13].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[1].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[1].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[1].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        listSpot[8].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[8].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[8].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 50,
                        ),
                        listSpot[12].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[12].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[12].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[0].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[0].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[0].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                          width: 50,
                        ),
                        listSpot[6].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[7].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[7].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 50,
                        ),
                        listSpot[11].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[11].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[11].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.start,
                  //   // crossAxisAlignment: CrossAxisAlignment.center,
                  //   // mainAxisSize: MainAxisSize.max,
                  //   children: [
                  Text(
                    "Spot for passing guests",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                  //   ],
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[18].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[18].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[18].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        // SizedBox(
                        //   height: 16,
                        //   width: 50,
                        // ),
                        listSpot[19].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[19].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[19].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        listSpot[20].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[20].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[20].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[21].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[21].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[21].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[22].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[22].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[22].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[23].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[23].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[23].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 20, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        listSpot[24].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[24].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[24].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        // SizedBox(
                        //   height: 16,
                        //   width: 50,
                        // ),
                        listSpot[25].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[25].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[25].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        listSpot[26].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[26].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[26].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[27].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[27].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[27].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[28].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[28].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[28].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        listSpot[29].available == true
                            ? Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x1f000000),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[29].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${listSpot[29].spotId}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            border:
                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Align(
                            alignment: Alignment(-0.1, 0.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "You",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 16,
                        //   width: 50,
                        // ),
                      ],
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [],
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: buttonPrimary,
                onPressed: () {},
                child: Text(
                  "Navigation",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
