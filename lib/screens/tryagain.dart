import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myteam/config/colors.dart';
class TryAgainButton extends StatelessWidget {
  Function action;

  TryAgainButton({ required this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: action(),
            icon: Icon(LineIcons.syncIcon,color: Colors.white,),
            label: Text(
              "Try Again",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}

