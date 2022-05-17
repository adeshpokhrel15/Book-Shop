import 'package:bookshop/providers/userProvider.dart';
import 'package:bookshop/widgets/drawerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class myProfile extends StatelessWidget {
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final profile = ref.watch(userStream);

        return Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "My Profile",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          drawer: drawerWidgets(),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 548,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 250,
                              height: 80,
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      profile.when(
                                          data: (data) {
                                            return Column(
                                              children: [
                                                Text(
                                                  data.userName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                                Text(data.email,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15)),
                                              ],
                                            );
                                          },
                                          error: (err, stack) => Text('$err'),
                                          loading: () => Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )),
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.grey,
                                      ),
                                      backgroundColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        listTile(icon: Icons.shop_outlined, title: "My Orders"),
                        listTile(
                            icon: Icons.location_on_outlined,
                            title: "My Delivery Address"),
                        listTile(
                            icon: Icons.person_outline,
                            title: "Refer A Friends"),
                        listTile(
                            icon: Icons.file_copy_outlined,
                            title: "Terms & Conditions"),
                        listTile(
                            icon: Icons.policy_outlined,
                            title: "Privacy Policy"),
                        listTile(icon: Icons.add_chart, title: "About"),
                        listTile(
                            icon: Icons.exit_to_app_outlined, title: "Log Out"),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(
                        // userData.userImage ??
                        "assets/book1.jpg",
                      ),
                      radius: 45,
                      backgroundColor: Colors.grey),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
