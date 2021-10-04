import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldCustomWidget extends StatefulWidget {
  final data;
  const TextFieldCustomWidget({Key key, this.data}) : super(key: key);

  @override
  _TextFieldCustomWidgetState createState() =>
      _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends State<TextFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          Container(
            // height: 40.h,
            // width: 30.w,
            padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 4.h),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              widget.data["icon"],
              color: Colors.pink.shade600,
              size: 25.h,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data["title"],
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
              Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width/1.3,
                child: Text(widget.data["value"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          )
        
        ],
      ),
    );
  }
}