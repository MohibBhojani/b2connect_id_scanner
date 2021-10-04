import 'package:b2connect_id_scanner/models/user.dart';
import 'package:b2connect_id_scanner/providers/scanner_provider.dart';
import 'package:b2connect_id_scanner/services/navigation_service.dart';
import 'package:b2connect_id_scanner/utils/routes.dart';
import 'package:b2connect_id_scanner/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/field_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppUser user;
  List profile = [];
  @override
  void initState() {
    user = Provider.of<ScannerProvider>(context, listen: false).userData;
    profile = [
      {
        'title': "Name",
        "value": user.fullName,
        "icon": Icons.person,
      },
      {
        'title': "Gender",
        "value": user.gender == "M"
            ? "Male"
            : user.gender == ""
                ? ""
                : "Female",
        "icon": Icons.male_outlined,
      },
      {
        'title': "Date Of Birth",
        "icon": Icons.calendar_today_rounded,
        "value": user.dateOfBirth,
      },
      {
        'title': "Nationality",
        "icon": Icons.language,
        "value": user.nationality,
      },
      {
        'title': "Eid Number",
        "icon": Icons.card_membership_sharp,
        "value": user.id,
      },
      {
        'title': "Expiry",
        "icon": Icons.check_box_outline_blank_outlined,
        "value": user.expiryDate,
      },
    ];
    super.initState();
  }

  var navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink.shade600,
        toolbarHeight: 70.h,
        leading: Icon(
          Icons.receipt,
          color: Colors.white,
          size: 30.h,
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 25.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 25.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.logout,
                color: Colors.white,
                size: 25.h,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Center(
              child: Text(
            "Please confirm your personal information",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          )),
          SizedBox(height: 40.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: profile.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                children: [
                  TextFieldCustomWidget(data: profile[i]),
                  if (i >= 0) Divider()
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.h,
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      navigationService.navigateTo(ScanScreenRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.w600),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.40,
                          MediaQuery.of(context).size.height * 0.060),
                      primary: Colors.white,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Colors.pink.shade600, width: 2)),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.pink.shade600,
                            size: 25.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "SCAN",
                            style: TextStyle(
                              color: Colors.pink.shade600,
                              fontSize: 16.sp,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.w600),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.40,
                          MediaQuery.of(context).size.height * 0.060),
                      primary: Colors.pink.shade600,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Colors.pink.shade600, width: 2)),
                    ),
                    child: Container(
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
