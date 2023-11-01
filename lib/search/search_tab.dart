import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../my_theme.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(48),
          child: CupertinoSearchTextField(
            style: TextStyle(color: Colors.white),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyTheme.whiteColor,
                width: 1.4,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        // Image.asset('images/Group 22.png'),
      ],
    );
  }
}
