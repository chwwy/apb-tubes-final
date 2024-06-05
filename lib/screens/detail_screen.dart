import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/make_order_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${Helper.assetImagePath}ic_arrow_left.png')))),
                      ),
                      const Text("Details",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                      GestureDetector(
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Favorited")));
                        },
                        child: Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${Helper.assetImagePath}ic_love.png')))),
                      ),
                    ],
                  ),
                    const SizedBox(
                    height: 19.0,
                  ),
                  Container(
                      height: 226.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  '${Helper.assetImagePath}white_nissan_image.png')))),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    "Nissan GT R35",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                  ),
                  Text( 
                    "10 stock available",
                    style: TextStyle(fontSize: 12.0, color: lightGrey),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                            side: BorderSide.none,
                            avatar:
                                Image.asset('${Helper.assetImagePath}ic_car.png'),
                            label: Text(
                              "car",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: black45),
                            )),
                        Chip(
                            side: BorderSide.none,
                            avatar:
                                Image.asset('${Helper.assetImagePath}ic_jdm.png'),
                            label: Text(
                              "jdm",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: black45),
                            )),
                        Chip(
                            side: BorderSide.none,
                            avatar: Image.asset(
                                '${Helper.assetImagePath}ic_seat.png'),
                            label: Text(
                              "2 seat",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: black45),
                            )),
                        Chip(
                            side: BorderSide.none,
                            avatar: Image.asset(
                                '${Helper.assetImagePath}ic_nitro.png'),
                            label: Text(
                              "nitro",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: black45),
                            )),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "The GT-R35 is a legendary sports car made by Nissan with aggressive aerodynamic design. Equipped with a twin-turbocharged 3.8L V6 engine producing over 600 horsepower, all-wheel drive system, and dual-clutch automatic transmission, the GT-R35 delivers... ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14.0, color: greyDesc),
                  ),
                  Text(
                    "Read More",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: orangeDesc,
                        fontWeight: FontWeight.w500),
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 33.0,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Price",
                              style: TextStyle(fontSize: 15.0, color: black)),
                          Text("\$ 10.50",
                              style: TextStyle(fontSize: 20.0, color: black,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(width: 57.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MakeOrderScreen(),));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 21),
                              backgroundColor: lightGrey255,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0))),
                          child: const Text("Buy Now"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
