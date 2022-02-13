// ignore_for_file: file_names

import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;

  const ExandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExandableTextWidgetState createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hinddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(color: AppColors.paraColor, text: firstHalf)
          : Container(
              child: Column(
                children: [
                  SmallText(
                      color: AppColors.paraColor,
                      size: 15,
                      text: hinddenText
                          ? (firstHalf + "...")
                          : (firstHalf + secondHalf)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hinddenText = !hinddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          size: 16,
                          text: "Show more",
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          hinddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
