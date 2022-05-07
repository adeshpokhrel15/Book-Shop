import 'package:flutter/material.dart';

class searchItem extends StatelessWidget {
  bool isbool = false;
  searchItem({required this.isbool});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(child: Image.asset('assets/book1.jpg')),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: isbool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'One Indian Girl',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "Rs. 10",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    isbool == false
                        ? Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "1 book",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ))
                        : Text('1 book')
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 90,
                padding: isbool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isbool == false
                    ? Container(
                        height: 24,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 19,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.pink),
                              )
                            ])),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 28,
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 19,
                                    ),
                                    Text(
                                      'Add',
                                      style: TextStyle(color: Colors.pink),
                                    )
                                  ])),
                            )
                          ],
                        ),
                      ),
              )),
            ],
          ),
        ),
        isbool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
