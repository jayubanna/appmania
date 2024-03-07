import 'package:flutter/material.dart';
import 'main.dart';

class FoodDetail extends StatefulWidget {

   FoodDetail({Key? key}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int cout = 1;

  @override
  Widget build(BuildContext context) {
    final foodlist1 = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff4A9936),
          Color(0xff81D96A),
          Color(0xff97DF84)
        ])),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: 230),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
                  color: Color(0xffFFFFFF)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 230 - 150,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.network(foodlist1?["img"] ?? ""),
                  ),
                  Container(
                    height: 52,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff5CC24A)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                              onTap: () {
                                cout = cout - 1;
                                setState(() {});
                              },
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("$cout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                              onTap: () {
                                cout = cout + 1;
                                setState(() {});
                              },
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 20)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35,top: 20),
                        child: Row(
                          children: [
                            Text(
                              foodlist1?["name"] ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "Fresh Avocado, shrimps salad with lettuce green mix,\ncherry tomatoes,herbs and olive oil, lemon dressing \nhealthy food...",
                              style: TextStyle(
                                  color: Color(0xffADAEAF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  color: Color(0xff5CC24A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))
                        ])),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 15),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child:  Text(foodlist1?["rating"]?.toString() ?? "",style: TextStyle(fontSize:19,fontWeight: FontWeight.w600),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35 , top: 15),
                            child: Text("🔥",style: TextStyle(fontSize: 19),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 15),
                            child: Text("100 Kcal",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                          ),    Padding(
                            padding: const EdgeInsets.only(left: 30, top: 15),
                            child: Text("⏰",style: TextStyle(fontSize: 19),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 15),
                            child: Text("5-10 Min",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 20),
                            child: Text("Ingradients",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          ),
                        ],
                      ),
                      Row(
                        children: fooduse.map((e) {
                          return uses(
                            use: e["use"],
                          );
                        }).toList(),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(top: 40),
                       child: Container(
                         height: 70,
                         width: 300,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Color(0xff5CC24A)
                         ),
                         child: InkWell(
                           onTap: () {
                             if(foodlist1!=0)
                               {
                                 cartList.add(foodlist1!);
                               }
                             Navigator.pushNamed(context,"cart_page");
                           },
                             child: Center(child: Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),))),
                       ),
                     )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class uses extends StatelessWidget {
  String? use;
   uses({super.key,this.use});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18,top: 15),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xffF4F4F4)
            ),
            child: Center(child: Text(use??"",style: TextStyle(fontSize: 25),)),
          ),
        ),
      ],
    );
  }
}

List<Map> fooduse=[
  {"use":"🥐"},
  {"use":"🍅"},
  {"use":"🫒"},
  {"use":"🥑"},
  {"use":"🥝"},
];