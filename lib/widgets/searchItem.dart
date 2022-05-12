import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class searchItem extends StatelessWidget {
  bool isbool = false;
  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Product List'),
          centerTitle: true,
          actions: <Widget>[
            Center(
              child: Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ]),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Image(
                                    image: NetworkImage(
                                        productImage[index].toString()),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          productName[index].toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])
                                ])
                          ]),
                    ),
                  );
                }))
      ]),
    );
  }
}





















// import 'package:bookshop/providers/reviewCartProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class searchItem extends StatefulWidget {
//   bool isbool = false;
//   // int productPrice =0;

//   searchItem({required this.isbool}); // this.productPrice);

//   @override
//   State<searchItem> createState() => _searchItemState();
// }

// class _searchItemState extends State<searchItem> {
//   late int count = 1;

//   late int price = 10;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//           builder: (context, ref, child) {
//             final cartData = ref.watch(cartProvider);
//             //final  total = ref.watch(cartProvider.notifier).total;
//             return cartData.isEmpty ? Container(
//               child: Center(
//                 child: Text('No item added to Cart'),
//               ),
//             ): Column(
//               children: [
//                 Container(
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height * 0.75,
//                   child: ListView.builder(
//                       itemCount: cartData.length,
//                       itemBuilder: (context, index){
//                         final cart =cartData[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: double.infinity,
//                             child: Row(
//                               children: [
//                                 Image.network(cart.imageUrl,
//                                   height: 140, width: 140, fit: BoxFit.cover,),
//                                 SizedBox(width: 15,),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(cart.title),
//                                     SizedBox(height: 20,),
//                                     Text('Rs ${cart.price}'),
//                                     SizedBox(height: 17,),
//                                     Row(
//                                       children: [
//                                         SizedBox(width: 50,),
//                                         OutlinedButton(onPressed: (){
//                                           ref.read(cartProvider.notifier).addSingleCart(cart);
//                                         }, child: Icon(Icons.add)),
//                                        Padding(
//                                          padding: const EdgeInsets.symmetric(horizontal: 15),
//                                          child: Text('${cart.quantity}'),
//                                        ),
//                                         OutlinedButton(onPressed: (){
//                                           ref.read(cartProvider.notifier).removeSingleCart(cart);
//                                         }, child: Icon(Icons.remove))
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       }
//                   ),
//                 ),
//                 Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         children: [
//                    Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Text('Total Price:-'),
//                          Text('$total')
//                        ],
//                    ),
//                           SizedBox(height: 25,),
//                           Container(
//                             width: double.infinity,
//                             height: 45,
//                             child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(20)
//                                     )
//                                 ),
//                                 onPressed: () async{

//                                   final response =await ref.read(orderProvider.notifier).addOrder(
//                                       carts: cartData, total: total);
//                                if(response == 'success'){
//                                   ref.refresh(orderProvider.notifier);
//                                   ref.read(cartProvider.notifier).clearBox();
//                                  Navigator.of(context).pop();
//                                }

//                                 },
//                                 child: Text('CheckOut',
//                                   style: TextStyle(fontSize: 17),)
//                             ),
//                           )
//                 ],),
//                     ))

//               ],
//             );
//           }
//         )
//     );
//   }
// }










// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                   child: Container(
// //                 height: 100,
// //                 child: Center(
// //                     child: Image.network(
// //                         'https://heavenlybells.org/img/read-nepali-novel-online-free.jpg')),
// //               )),
// //               Expanded(
// //                   child: Container(
// //                 height: 100,
// //                 child: Column(
// //                   mainAxisAlignment: widget.isbool == false
// //                       ? MainAxisAlignment.spaceAround
// //                       : MainAxisAlignment.spaceEvenly,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Column(
// //                       children: [
// //                         Text(
// //                           'Summer Love',
// //                           style: TextStyle(
// //                               color: Colors.black,
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 16),
// //                         ),
// //                         Text(
// //                           "Rs. " + "${10 * count}",
// //                           style: TextStyle(
// //                               color: Colors.black, fontWeight: FontWeight.bold),
// //                         ),
// //                       ],
// //                     ),
// //                     widget.isbool == false
// //                         ? Container(
// //                             margin: EdgeInsets.only(right: 15),
// //                             padding: EdgeInsets.symmetric(horizontal: 10),
// //                             height: 35,
// //                             decoration: BoxDecoration(
// //                               border: Border.all(color: Colors.grey),
// //                               borderRadius: BorderRadius.circular(30),
// //                             ),
// //                             child: Row(
// //                               children: [
// //                                 Expanded(
// //                                   child: Text(
// //                                     "$count book",
// //                                     style: TextStyle(
// //                                       color: Colors.grey,
// //                                       fontSize: 14,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Center(
// //                                   child: Icon(
// //                                     Icons.arrow_drop_down,
// //                                     size: 20,
// //                                     color: Colors.black,
// //                                   ),
// //                                 )
// //                               ],
// //                             ))
// //                         : Text('$count book') //unit of product
// //                   ],
// //                 ),
// //               )),
// //               Expanded(
// //                 child: Container(
// //                   height: 90,
// //                   padding: widget.isbool == false
// //                       ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
// //                       : EdgeInsets.only(left: 15, right: 15),
// //                   child: widget.isbool == false
// //                       ? Padding(
// //                           padding: const EdgeInsets.only(top: 8),
// //                           child: Container(
// //                             height: 24,
// //                             width: 50,
// //                             decoration: BoxDecoration(
// //                               border: Border.all(color: Colors.grey),
// //                               borderRadius: BorderRadius.circular(30),
// //                             ),
// //                             child: InkWell(
// //                               onTap: () {},
// //                               child: Center(
// //                                   child: Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.center,
// //                                       children: [
// //                                     Icon(
// //                                       Icons.add,
// //                                       color: Colors.red,
// //                                       size: 19,
// //                                     ),
// //                                     Text(
// //                                       'Add',
// //                                       style: TextStyle(color: Colors.pink),
// //                                     )
// //                                   ])),
// //                             ),
// //                           ),
// //                         )
// //                       : Padding(
// //                           padding: const EdgeInsets.symmetric(
// //                             horizontal: 13,
// //                           ),
// //                           child: Column(children: [
// //                             InkWell(
// //                               onTap: () {},
// //                               child: Icon(
// //                                 Icons.delete, //
// //                                 color: Colors.red,
// //                                 size: 30,
// //                               ),
// //                             ),
// //                             SizedBox(height: 10),
// //                             Container(
// //                               height: 28,
// //                               width: 100,
// //                               decoration: BoxDecoration(
// //                                 border: Border.all(color: Colors.grey),
// //                                 borderRadius: BorderRadius.circular(40),
// //                               ),
// //                               child: Center(
// //                                 child: Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     InkWell(
// //                                       onTap: () {
// //                                         if (count == 1) {
// //                                           Text('Maximun Reach');
// //                                         } else {
// //                                           setState(() {
// //                                             count--;
// //                                           });
// //                                         }
// //                                       },
// //                                       child: Icon(
// //                                         Icons.remove,
// //                                         color: Colors.red,
// //                                         size: 20,
// //                                       ),
// //                                     ),
// //                                     Text(
// //                                       "$count",
// //                                       style: TextStyle(
// //                                         color: Colors.red,
// //                                       ),
// //                                     ),
// //                                     InkWell(
// //                                       onTap: () {
// //                                         if (count < 10) {
// //                                           setState(() {
// //                                             count++;
// //                                           });
// //                                         }
// //                                       },
// //                                       child: Icon(
// //                                         Icons.add,
// //                                         color: Colors.red,
// //                                         size: 20,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           ]),
// //                         ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //         widget.isbool == false
// //             ? Container()
// //             : Divider(
// //                 height: 1,
// //                 color: Colors.black45,
// //               )
// //       ],
// //     );
// //   }
// // }
