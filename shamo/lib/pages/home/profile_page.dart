import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget header(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor1,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/image_profile.png',
                  width: 64,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, Rinal',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'muhafrinal@gmail.com',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: Image.asset('assets/exit_button.png', height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String text) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: secondaryTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget content(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor3,
        ),
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem('Edit Profile'),
            ),
            menuItem('Your Orders'),
            menuItem('Help'),
            SizedBox(height: 30),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(context),
        content(context),
      ],
    );
  }
}
