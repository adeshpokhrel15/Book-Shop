import 'package:bookshop/widgets/myProfile.dart';
import 'package:bookshop/widgets/reviewCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drawerWidgets extends StatelessWidget {
  Widget listTile({
    required String title,
    required IconData iconData,
  }) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: () {},
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey,
            child: ListView(
              children: [
                DrawerHeader(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white54,
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            backgroundImage: AssetImage('assets/book1.jpg'),
                            radius: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Adesh'),
                            Text(
                              'Adesh@',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outlined),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => myProfile()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shop_outlined),
                  title: Text('Cart'),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_outlined),
                  title: Text('Notification'),
                ),
                ListTile(
                  leading: Icon(Icons.shop_outlined),
                  title: Text('Review Cart'),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => reviewCart()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.format_quote_outlined),
                  title: Text('FAQ'),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text("Log Out"),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 350,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Support"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Call us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("984125010"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text("Mail us:"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "bookshop@gmail.com",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
