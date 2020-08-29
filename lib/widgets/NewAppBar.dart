import 'package:drawTask/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class NewAppBar extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final Function func1;
  final Function func2;
  const NewAppBar({Key key, this.icon1, this.icon2, this.func1, this.func2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButtons(
          icon: icon1,
          onPressed: func1,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: IconButtons(
            icon: icon2,
            onPressed: func2,
          ),
        )
      ],
    );
  }
}
