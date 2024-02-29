// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      this.bdRadius,
      this.elevation,
      this.bgColor,
      this.widgetIcon,
      this.text1,
      this.ftSize,
      this.txtColor,
      this.onPressed,
      this.isLoadingPart,
      this.borderColor});
  final double? bdRadius;
  final double? elevation;
  final Color? bgColor;
  final String? text1;
  final double? ftSize;
  final Color? txtColor;
  final Color? borderColor;
  final Function()? onPressed;
  final Widget? widgetIcon;
  bool ? isLoadingPart;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? Colors.transparent)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bdRadius ?? 2),
          )),
          elevation: MaterialStateProperty.all(elevation ?? 2),
          backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.grey)),
      child: Center(
        child: (isLoadingPart == true)
            ? Padding(
                padding: EdgeInsets.only(left: 100.0),
                child: Row(
                  children: [
                    Text('Loading',
                        style: TextStyle(
                            fontSize: ftSize ?? 12,
                            color: txtColor ?? Colors.white)),
                    // SizedBox(
                    //   width: 3.w,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  ],
                ),
              )
            : Text(
                "$text1",
                style: TextStyle(
                    fontSize: ftSize ?? 12, color: txtColor ?? Colors.white),
              ),
      ),
    );
  }
}
