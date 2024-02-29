import 'package:agromate/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color.fromARGB(255, 78, 110, 27),
            ),
          ),
        )),
        actions: [
          InkWell(
            onTap: null,
            child: Image(image: AssetImage("assets/Wishlist.png")),
          ),
          16.widthBox,
          InkWell(
            onTap: () => Get.to(() => LoginScreen()),
            child: Padding(
              padding: const EdgeInsets.only(right: 17.5),
              child: Image(image: AssetImage("assets/ring.png")),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8, // Assuming you have 8 images
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 230, // Increase the height of the images
                ),
                itemBuilder: (context, index) {
                  // List of images
                  List<String> images = [
                    "assets/Vegetables_.png",
                    "assets/Fruits.png",
                    "assets/Seeds.png",
                    "assets/Flowers.png",
                    "assets/DairyProducts.png",
                    "assets/Grains.png",
                    "assets/Spices.png",
                    "assets/Fertilizer.png"
                  ];

                  return SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          images[index],
                          width: 200, // Adjust the width of the image
                          height: 230, // Adjust the height of the image
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                            height: 100), // Add space between image and tex
                      ],
                    ).p(12),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
