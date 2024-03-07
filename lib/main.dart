import 'dart:ffi';

import 'package:flutter/material.dart';
import 'food_detail.dart';
import 'cart_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => Appmania(),
      "food_detail": (context) => FoodDetail(),
      "cart_page": (context) => cartpage(),
    },
  ));
}

class Appmania extends StatefulWidget {
  const Appmania({super.key});

  @override
  State<Appmania> createState() => _AppmaniaState();
}

class _AppmaniaState extends State<Appmania> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 35),
                  Text(
                    "Habiganj City",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 170),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffF4F4F4)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "cart_page");
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 120),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Find The",
                    style: TextStyle(color: Colors.black, fontSize: 27)),
                TextSpan(
                    text: " Best\n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "Food",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "  Around You",
                    style: TextStyle(color: Colors.black, fontSize: 27)),
              ])),
            ),
            Container(
              height: 60,
              width: 600,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Icon(
                        Icons.search,
                        size: 29,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Search your favourit food",
                      style: TextStyle(
                          color: Color(0xffADAEAF),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Icon(Icons.sync_alt_outlined),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 20),
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Find  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: "5km",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp,
                            size: 16, color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color(0xff5CC24A),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          "Salads",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        )),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          "Hot sale",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          "Popularity",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: foodlist1.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "food_detail",
                                arguments: e);
                          },
                          child: Food(
                            img: e["img"],
                            name: e["name"],
                            min: e["min"],
                            price: e["price"],
                            rating: e["rating"],
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      children: foodlist2.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "food_detail",
                                arguments: e);
                          },
                          child: Food(
                            img: e["img"],
                            name: e["name"],
                            min: e["min"],
                            price: e["price"],
                            rating: e["rating"],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  String? name;
  String? img;
  String? min;
  double? price;
  double? rating;

  Food({super.key, this.name, this.img, this.min, this.price, this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          width: 180,
          margin: EdgeInsets.only(left: 17, top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffF4F4F4)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 10),
                child: Icon(Icons.favorite_border),
              ),
              Image.network(
                img ?? "",
                height: 130,
                width: 150,
              ),
              Text(
                name ?? "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Text(
                      min ?? "",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffADAEAF)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: Icon(
                      Icons.star_border,
                      color: Colors.orangeAccent,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      "$rating",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffADAEAF)),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      "\$$price",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 47,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff5CC24A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

List<Map> foodlist1 = [
  {
    "img":
        "https://i.pinimg.com/originals/5e/74/7a/5e747a359c5347e7854903bb8486ce90.png",
    "name": "Avocada salad",
    "min": "20min",
    "price": 12.00,
    "rating": 4.5,
    "qty":1
  },
  {
    "img":
        "https://i.pinimg.com/originals/5e/74/7a/5e747a359c5347e7854903bb8486ce90.png",
    "name": "Fruits salad ",
    "min": "20min",
    "price": 11.00,
    "rating": 4.5,
    "qty":1
  },
];

List<Map> foodlist2 = [
  {
    "img":
        "https://i.pinimg.com/originals/5e/74/7a/5e747a359c5347e7854903bb8486ce90.png",
    "name": "Cucumber Salad",
    "min": "20min",
    "qty":1,
    "price": 12.00,
    "rating": 4.5,
  },
  {
    "img":
        "https://i.pinimg.com/originals/5e/74/7a/5e747a359c5347e7854903bb8486ce90.png",
    "name": "Avocada",
    "min": "20min",
    "price": 11.00,
    "rating": 4.5,
    "qty":1,
  },
];

List<Map> cartList = [];
