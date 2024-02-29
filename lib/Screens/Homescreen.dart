import 'package:agromate/Screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      child: Image.asset(
                        "assets/userp.png",
                        width: 40,
                        height: 50,
                      ),
                    ),
                    3.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Pareshbhai",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        // SizedBox(height: 2),
                        Text(
                          "Enjoy your services",
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Colors.grey,
                          ),
                        ).pOnly(bottom: 0),
                      ],
                    ),
                    122.widthBox,
                    InkWell(
                      onTap: null,
                      child: Image(image: AssetImage("assets/Wishlist.png")),
                    ),
                    16.widthBox,
                    InkWell(
                      onTap: null,
                      child: Image(image: AssetImage("assets/ring.png")),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            hintText: "Search anything",
                          ),
                        ),
                      ),
                      10.widthBox,
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Add your action here when the mage_filter icon is tapped
                            },
                            child: Image(
                                image: AssetImage("assets/mage_filter.png")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                VxSwiper.builder(
                  autoPlay: true,
                  height: 128,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 10,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      "assets/Farmer.png",
                      fit: BoxFit.fill,
                      height: 120,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(
                          const EdgeInsets.symmetric(horizontal: 8),
                        )
                        .make();
                  },
                ),
                20.heightBox,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    8.5.widthBox,
                    Text(
                      "Shop by Top Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    130.5.widthBox,
                    GestureDetector(
                      onTap: () => Get.offAll(Categories()),
                      child: Text(
                        "View More",
                        style: TextStyle(color: Colors.green, fontSize: 13.75),
                      ),
                    ),
                  ],
                ),
                14.4.heightBox,
                Row(
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      child: Image.asset(
                        "assets/Vegetables_.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Image.asset(
                        "assets/Fruits.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Image.asset(
                        "assets/Seeds.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                19.heightBox,
                Padding(
                  padding: const EdgeInsets.only(right: 234),
                  child: Text(
                    "Featured Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                15.heightBox,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8, // Assuming you have 4 images
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 163.5,
                  ),
                  itemBuilder: (context, index) {
                    // List of images
                    List<String> images = [
                      "assets/potato.png",
                      "assets/Tomato.png",
                      "assets/Broccoli.png",
                      "assets/rice_seeds.png",
                      "assets/cumin.png",
                      "assets/sunflower.png",
                      "assets/tuimeric.png",
                      "assets/apples.png",
                    ];

                    List<Map<String, dynamic>> itemInfo = [
                      {
                        "name": "Potatoes, 50/kg",
                        "order By": "Sunday, 3 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Tomatoes, 65/kg",
                        "order By": "Monday, 4 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Broccoli , 90/kg",
                        "price": "90/kg",
                        "order By": "Wednesday, 5 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Rice Seeds, 210/kg",
                        "order By": "Thursday, 6 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Cumin, 250/kg",
                        "order By": "Friday, 6 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "SunFlower, 100/kg",
                        "order By": "Friday, 6 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Turmeric, 503/kg",
                        "order By": "Friday, 6 March",
                        "freeDelivery": false,
                      },
                      {
                        "name": "Apple, 97/kg",
                        "order By": "Friday, 6 March",
                        "freeDelivery": false,
                      }
                    ];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            images[index],
                            width: 200,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                          2.heightBox, // Add some spacing between the image and text
                          Text(
                            itemInfo[index]["name"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Order By: ${itemInfo[index]["order By"]}",
                            style: const TextStyle(color: Colors.green),
                          ),
                          if (itemInfo[index]["freeDelivery"])
                            Text(
                              "Free Delivery",
                              style: const TextStyle(color: Colors.blue),
                            ),
                        ],
                      ).p(12),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
