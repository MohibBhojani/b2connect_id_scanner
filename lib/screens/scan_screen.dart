import 'dart:io';

import 'package:b2connect_id_scanner/providers/scanner_provider.dart';
import 'package:b2connect_id_scanner/services/navigation_service.dart';
import 'package:b2connect_id_scanner/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

import '../services/util_service.dart';
import '../utils/service_locator.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  UtilService utilService = locator<UtilService>();
  var navigationService = locator<NavigationService>();
  bool isLoadingProgress = false;
  File image1;
  File image2;
  File image;
  var user;

  Future<File> getFromCamera() async {
    final picker = ImagePicker();
    var imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFile == null) {
      return image;
    }
    image = File(imageFile.path);
    return image;
  }

  Future<File> getFromGallery() async {
    final picker = ImagePicker();
    var imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (imageFile == null) {
      return image;
    }
    image = File(imageFile.path);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(54, 54, 54, 1),
          body: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            navigationService.navigateTo(ProfileScreenRoute);
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: sy(30), right: sy(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ImageIcon(
                                  AssetImage("assets/images/cross.png"),
                                  size: sy(12),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sy(10),
                        ),
                        image1 == null
                            ? ImageIcon(
                                AssetImage("assets/images/1.png"),
                                size: sy(60),
                                color: Colors.white,
                              )
                            : Container(
                                width: sy(180),
                                height: sy(100),
                                child: Image.file(
                                  image1,
                                  scale: 5,
                                  fit: BoxFit.fill,
                                  // height: 300,
                                  // width: double.infinity,
                                ),
                              ),
                        SizedBox(
                          height: sy(8),
                        ),
                        Text(
                          "Scan the front side",
                          style:
                              TextStyle(color: Colors.white, fontSize: sy(20)),
                        ),
                        SizedBox(
                          height: sy(8),
                        ),
                        Container(
                            width: sy(90),
                            child: OutlineButton(
                              child: Text('SCAN',
                                  style: TextStyle(color: Colors.white)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                              onPressed: () {
                                _settingModalBottomSheet(context, 1);
                              },
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: sy(8),
                        ),
                        image2 == null
                            ? ImageIcon(
                                AssetImage("assets/images/1.png"),
                                size: sy(60),
                                color: Colors.white,
                              )
                            : Container(
                                width: sy(180),
                                height: sy(100),
                                child: Image.file(
                                  image2,
                                  scale: 5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        SizedBox(
                          height: sy(8),
                        ),
                        Text(
                          "Scan the back side",
                          style:
                              TextStyle(color: Colors.white, fontSize: sy(20)),
                        ),
                        SizedBox(
                          height: sy(8),
                        ),
                        Container(
                            width: sy(90),
                            child: OutlineButton(
                              child: Text('SCAN',
                                  style: TextStyle(color: Colors.white)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                              onPressed: () {
                                _settingModalBottomSheet(context, 2);
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      height: sy(8),
                    ),
                    Container(
                        width: sy(180),
                        child: OutlineButton(
                          child: Text('SUBMIT',
                              style: TextStyle(color: Colors.white)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                          onPressed: () {
                            if (image1 == null) {
                              utilService.showToast('please add both images');
                            } else {
                              navigationService.navigateTo(ProfileScreenRoute);
                            }
                          },
                        )),
                  ],
                ),
              ),
              if (isLoadingProgress)
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )),
            ],
          ));
    });
  }

  void _settingModalBottomSheet(context, var id) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Upload  Picture",
                      //'Upload Profile Picture',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(),
                new ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            begin: (Alignment.bottomCenter),
                            end: (Alignment.bottomLeft),
                            colors: [
                              Colors.purple,
                              Colors.purpleAccent,
                            ])),
                    child: new Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                  title: new Text("Take Photo",
                      // 'Take Photo',
                      style: Theme.of(context).textTheme.subtitle2),
                  onTap: () async {
                    setState(() {
                      isLoadingProgress = true;
                    });

                    var val = await getFromCamera();
                    if (Platform.isAndroid || Platform.isIOS) {
                      await Provider.of<ScannerProvider>(context, listen: false)
                          .scanImage(val, id);
                    } else {
                      await Provider.of<ScannerProvider>(context, listen: false)
                          .scanImageHarmonyOS(val, id);
                    }

                    setState(() {
                      if (id == 1) {
                        image1 = val;
                      } else {
                        image2 = val;
                      }
                      isLoadingProgress = false;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: new ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(top: 3),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: (Alignment.bottomCenter),
                              end: (Alignment.bottomLeft),
                              colors: [
                                Colors.pink,
                                Colors.pinkAccent,
                              ])),
                      child: new Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    title: new Text("Browse",
                        // 'Browse',
                        style: Theme.of(context).textTheme.subtitle2),
                    onTap: () async {
                      setState(() {
                        isLoadingProgress = true;
                      });
                      var val = await getFromGallery();
                      if (Platform.isAndroid || Platform.isIOS) {
                        await Provider.of<ScannerProvider>(context,
                                listen: false)
                            .scanImage(val, id);
                      } else {
                        await Provider.of<ScannerProvider>(context,
                                listen: false)
                            .scanImageHarmonyOS(val, id);
                      }
                      setState(() {
                        if (id == 1) {
                          image1 = val;
                        } else {
                          image2 = val;
                        }
                        isLoadingProgress = false;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
