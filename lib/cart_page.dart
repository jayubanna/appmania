import 'package:flutter/material.dart';
import 'main.dart';

class cartpage extends StatefulWidget {
  cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  double delivary = 3.50;

  @override
  Widget build(BuildContext context) {
    double subtotal = subtotalprice();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Color(0xffFFFFFF)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Text(
                    "Subtotal",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 230),
                  child: Text(
                    "\$$subtotal",
                    style: TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Delivary",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 230),
                  child: Text(
                    "\$$delivary",
                    style: TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 260),
                  child: Text(
                    "${subtotal+delivary}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff5CC24A)),
                child: Center(
                    child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/12858a32751817.56929eefe8431.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color(0xffF9F8FD)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: SingleChildScrollView(
              child: Column(
                  children: cartList.map((e) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      height: 100,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffFFFFFF)),
                      child: Row(
                        children: [
                          Image.network(e["img"] ?? "", height: 130),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 40),
                                      child: Text(
                                        e["name"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (e["qty"] > 1) {
                                            e["qty"] = e["qty"] - 1;
                                            setState(() {});
                                          } else {
                                            cartList.remove(e);
                                            setState(() {});
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20),
                                          child: Icon(Icons.remove_circle),
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10),
                                      child: Text(
                                        e["qty"].toString(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          e["qty"] = e["qty"] + 1;
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10),
                                          child: Icon(
                                              Icons.add_circle_rounded),
                                        ))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 150, top: 8),
                                    child: Text(
                                      "\$" + e["price"].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                    "\$" + (e["qty"] * e["price"]).toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xffADAEAF)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text("Cart",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                    setState(() {});
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
      Container(
        margin: EdgeInsets.only(top: 510, left: 30),
            height: 65,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffFFFFFF)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child:
                      Icon(Icons.qr_code_2, color: Color(0xffADAEAF), size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("Promo Code",
                      style: TextStyle(color: Color(0xffADAEAF), fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff5CC24A)),
                    child: Center(
                        child: Text(
                      "App",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  double subtotalprice() {
    double subtotal = 0;
    cartList.forEach((e) {
      subtotal += e["qty"] * e["price"];
    });
    return subtotal;
}
}
