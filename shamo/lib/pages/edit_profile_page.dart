import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: primaryColor,
            onPressed: () {},
          )
        ],
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: defaultMargin),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/image_profile.png'),
                  ),
                ),
              ),
            ),
            Text("test"),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
