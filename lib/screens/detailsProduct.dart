import 'package:flutter/material.dart';

class detailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/books.jpg'), fit: BoxFit.cover),
                )),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              )),
            ],
          )),
    );
  }
}






// import 'package:bookshop/providers/productProvider.dart';
// import 'package:bookshop/widgets/reviewCart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum SinginCharacter { fill, outline }

// class detailProduct extends StatefulWidget {
//   @override
//   State<detailProduct> createState() => _detailProductState();
// }

// class _detailProductState extends State<detailProduct> {
//   late int count = 0;
//   SinginCharacter _character = SinginCharacter.fill;

//   // Widget NavigatorBar({
//   //   required Color iconColor,
//   //   required Color backgroundColor,
//   //   required Color color,
//   //   required String title,
//   //   required IconData iconData,
//   //   // required Function onTap,
//   // }) {
//   //   return Expanded(
//   //     child: GestureDetector(
//   //       child: Container(
//   //         padding: EdgeInsets.all(20),
//   //         color: backgroundColor,
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             Icon(
//   //               iconData,
//   //               size: 20,
//   //               color: iconColor,
//   //             ),
//   //             SizedBox(
//   //               width: 5,
//   //             ),
//   //             Text(
//   //               title,
//   //               style: TextStyle(color: color),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
//       final details = ref.watch(postStream);
//       return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           title: Text(
//             "Product Details",
//             style: TextStyle(color: Colors.pink),
//           ),
//         ),
//         // bottomNavigationBar: Row(
//         //   children: [
//         //     NavigatorBar(
//         //         backgroundColor: Colors.yellow,
//         //         color: Colors.black,
//         //         iconColor: Colors.grey,
//         //         title: "Add To WishList",
//         //         iconData:
//         //             //wishListBool == false
//         //             // ?
//         //             Icons.favorite_outline
//         //         // : Icons.favorite,

//         //         // onTap: () {

//         //         ),
//         //     NavigatorBar(
//         //       backgroundColor: Colors.yellow,
//         //       color: Colors.black,
//         //       iconColor: Colors.white70,
//         //       title: "Go To Cart",
//         //       iconData: Icons.shop_outlined,
//         //       //onTap: () {
//         //       // Navigator.of(context).push(
//         //       //  MaterialPageRoute(
//         //       //  builder: (context) => reviewCart(),
//         //       // ),
//         //       //);
//         //       //}),
//         //       //],
//         //     ),

//         //     // ),
//         //   ],

//         body: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     details.when(
//                       data: (data) {
//                         // return Container(
//                         //     child: ListTile(
//                         //   title: Text(data[0].productName),
//                         //   subtitle: Text("10"),
//                         // ));
//                         // Container(
//                         //     height: 250,
//                         //     padding: EdgeInsets.all(40),
//                         //     child: Image.network(
//                         //       data[0].productImage,
//                         //       fit: BoxFit.cover,
//                         //     ));
//                         // Container(
//                         //   padding: EdgeInsets.symmetric(horizontal: 20),
//                         //   width: double.infinity,
//                         //   child: Text(
//                         //     "Available Options",
//                         //     textAlign: TextAlign.start,
//                         //     style: TextStyle(
//                         //       color: Colors.black,
//                         //       fontWeight: FontWeight.w600,
//                         //     ),
//                         //   ),
//                         // );
//                         // Padding(
//                         //   padding: EdgeInsets.symmetric(
//                         //     horizontal: 10,
//                         //   ),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Row(
//                         //         children: [
//                         //           CircleAvatar(
//                         //             radius: 3,
//                         //             backgroundColor: Colors.green[700],
//                         //           ),
//                         //           Radio(
//                         //             value: SinginCharacter.fill,
//                         //             groupValue: _character,
//                         //             activeColor: Colors.green[700],
//                         //             onChanged: (value) {
//                         //               setState(() {
//                         //                 //    _character = value;
//                         //               });
//                         //             },
//                         //           ),
//                         //         ],
//                         //       ),
//                         //       Text("100"),
//                         //       Container(
//                         //         padding: EdgeInsets.symmetric(
//                         //           horizontal: 30,
//                         //           vertical: 10,
//                         //         ),
//                         //         decoration: BoxDecoration(
//                         //           border: Border.all(
//                         //             color: Colors.grey,
//                         //           ),
//                         //           borderRadius: BorderRadius.circular(
//                         //             30,
//                         //           ),
//                         //         ),
//                         //         child: Row(
//                         //           mainAxisAlignment: MainAxisAlignment.center,
//                         //           children: [
//                         //             Icon(
//                         //               Icons.add,
//                         //               size: 17,
//                         //               color: Colors.red,
//                         //             ),
//                         //             Text(
//                         //               "ADD",
//                         //               style: TextStyle(color: Colors.red),
//                         //             )
//                         //           ],
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // );
//                       },
//                       error: (err, stack) => Text('$err'),
//                       loading: () => Container(),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 width: double.infinity,
//                 child: ListView(
//                   children: [
//                     Text(
//                       "About This Product",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
