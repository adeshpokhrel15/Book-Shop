import 'package:bookshop/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends StatelessWidget {
  final AsyncValue<List<User>> userData;

  UserPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userData.when(
          data: (data) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(data[index].email),
                          radius: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data[index].userName)
                      ],
                    ),
                  );
                });
          },
          error: (err, stack) => Text('$err'),
          loading: () => Container()),
    );
  }
}
