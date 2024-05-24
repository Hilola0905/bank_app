
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          decoration:const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 0,
              offset: Offset(0.0, 0.8),
            ),
          ], color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/women1.jpg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const  SizedBox(width: 4),
                  const  Text(
                    "Need Product",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                height: 44,
                width: 44,
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(0.0, 0.8),
                      ),
                    ]),
                child: IconButton(
                  onPressed: () {},
                  icon:const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    //  bottomNavigationBar:const BottomNavBarCurvedFb1(),
      body: SafeArea(
        child: ListView(
          children: [
           const SizedBox(height: 10,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 14),
              padding:const EdgeInsets.fromLTRB(10, 30, 0, 36),
              height: 157,
              width: double.infinity,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/women2.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        Text(
                          "Paket Cheese",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Burger komplit",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 23,
                    width: 100,
                    padding:const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                        onTap: () {},
                        child:const Text(
                          "Order Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(24, 4, 0, 12),
              child:const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(0, 0.1),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/baby1.jpg',
                        height: 64,
                        width: 64,
                      ),
                      Text("Baby Clothes"),
                    ],
                  ),
                ),
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(0, 0.1),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/medice.jpg',
                        height: 60,
                        width: 60,
                      ),
                      const Text("Dori-daramon"),
                    ],
                  ),
                ),
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(0, 0.1),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/img.png',
                        height: 64,
                        width: 64,
                      ),
                      Text("Toys"),
                    ],
                  ),
                ),
              ],
            ),
            const  SizedBox(
              height: 20,
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(24, 4, 24, 12),
              child:const Text(
                "Popular Now",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 197,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  popularNow("assets/images/baby1.jpg", "Baby clothes",
                      "Mcdf", "Rp.20.000"),
                  popularNow("assets/images/baby.jpg", "Pizza Fruit",
                      "Pija hut", "Rp.40.000"),
                  popularNow("assets/images/vitamin.jpg", "Sandwich",
                      "Roti r", "Rp.10.000"),
                  popularNow("assets/images/women1.jpg", "Beef Burger",
                      "Mcdi", "Rp.20.000"),
                  popularNow("assets/images/women2.jpg", "Pizza Fruit",
                      "Pija hut", "Rp.40.000"),
                  popularNow("assets/images/img.png", "Sandwich",
                      "Roti r", "Rp.10.000"),
                  popularNow("assets/images/medice.jpg", "Beef Burger",
                      "Mcdi", "Rp.20.000"),
                  popularNow("assets/images/baby.jpg", "Pizza Fruit",
                      "Pija hut", "Rp.40.000"),
                  popularNow("assets/images/women.jpg", "Sandwich",
                      "Roti r", "Rp.10.000"),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(24, 4, 24, 12),
              child:const Text(
                "Recommended",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 154,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  recommennded("assets/images/medice.jpg"),
                  const   SizedBox(width: 20),
                  recommennded("assets/images/vitamin.jpg"),
                  const   SizedBox(width: 20),
                  recommennded("assets/images/women.jpg"),
                  const   SizedBox(width: 20),
                  recommennded("assets/images/baby1.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/img.png"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/women2.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/baby.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/women.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/baby1.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/women1.jpg"),
                  const  SizedBox(width: 20),
                  recommennded("assets/images/medice.jpg"),
                  const   SizedBox(width: 20),
                  recommennded("assets/images/women.jpg"),
                  const  SizedBox(width: 20),
                ],
              ),
            ),
            const  SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget popularNow(image, title, subtitle, price) {
    return Expanded(
      child: Container(
        width: 152,
        padding:const EdgeInsets.symmetric(vertical: 10),
        margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow:const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                offset: Offset(0, 0.1),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 1),
            Text(
              title,
              style:const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style:const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black38),
            ),
            const  SizedBox(height: 1),
            Text(
              price,
              style:const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  Widget recommennded(image) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image)),
          boxShadow:const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(0.2, 0.3),
            )
          ]),
    );
  }
}
