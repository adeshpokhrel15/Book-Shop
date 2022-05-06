import 'package:flutter/material.dart';

class searchItem extends StatelessWidget {
  bool isbool = false;
  searchItem({required this.isbool});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          'proudctName',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "productPrice",
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
                                    "productQuantity",
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
                height: 100,
                padding: isbool == false
                    ? EdgeInsets.symmetric(horizontal: 10, vertical: 30)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isbool == false
                    ? Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.grey,
                                size: 19,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.red),
                              )
                            ])),
                      )
                    : Column(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.grey,
                                    size: 19,
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.red),
                                  )
                                ])),
                          )
                        ],
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
