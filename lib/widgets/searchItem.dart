import 'package:flutter/material.dart';

class searchItem extends StatefulWidget {
  bool isbool = false;
  // int productPrice =0;

  searchItem({required this.isbool}); // this.productPrice);

  @override
  State<searchItem> createState() => _searchItemState();
}

class _searchItemState extends State<searchItem> {
  late int count = 1;

  late int price = 10;

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
                child: Center(
                    child: Image.network(
                        'https://heavenlybells.org/img/read-nepali-novel-online-free.jpg')),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: widget.isbool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Summer Love',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "Rs. " + "${price * count}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    widget.isbool == false
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
                        : Text('$count book') //unit of product
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.isbool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isbool == false
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 24,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {},
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
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          child: Column(children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.delete, //
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 28,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (count == 1) {
                                          Text('Maximun Reach');
                                        } else {
                                          setState(() {
                                            count--;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "$count",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (count < 10) {
                                          setState(() {
                                            count++;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                ),
              )
            ],
          ),
        ),
        widget.isbool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
