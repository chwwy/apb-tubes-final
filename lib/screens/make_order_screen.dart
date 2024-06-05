import 'package:apb5/data/vehicle_model.dart';
import 'package:apb5/data/vehicles_data.dart';
import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/home_screen.dart';
import 'package:apb5/screens/order_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:apb5/themes/values_manager/strings.dart';
import 'package:flutter/material.dart';

class MakeOrderScreen extends StatefulWidget {
  const MakeOrderScreen({super.key});

  @override
  State<MakeOrderScreen> createState() => _MakeOrderScreenState();
}

class _MakeOrderScreenState extends State<MakeOrderScreen> {

  List<VehicleModel> cartItems = []; 

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = VehiclesData();
    cartItems = data.getCart();
    print(cartItems);
  }

  

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
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                        },
                        child: Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${Helper.assetImagePath}ic_arrow_left.png')))),
                      ),
                      const Text(
                        "Order",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox.shrink()
                   
                    ],
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  //
                  Expanded(
                    child: Container(
                      child: ListView.builder(itemBuilder: (context, index) {
                          return VehicleOrderCarWidget(vehicle: cartItems[index],);

                      }, itemCount: cartItems.length,),
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Payment Summary",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: black),
                      ),
                      Text(
                        "\$ 10.50",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: black),
                      ),
                      Text(
                        "\$ 10.50",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                   const SizedBox(
                        width: 19.0,
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 32.0,
                          width: 32.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      '${Helper.assetImagePath}ic_moneys.png')))),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: lightGrey255
                              ),
                              child: const Text("QRIS", style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white
                              )
                              ,
                              ),
                            ),
                            Positioned(
                              left: 40,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white
                                ),
                                child: Text("\$ 10.50", style: TextStyle(
                                  fontSize: 12.0,
                                  color: black
                                )
                                ,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   "\$ 10.50",
                      //   textAlign: TextAlign.justify,
                      //   style: TextStyle(
                      //       fontSize: 14.0,
                      //       color: black,
                      //       fontWeight: FontWeight.w600),
                      // ),
                       Container(
                          height: 32.0,
                          width: 32.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      '${Helper.assetImagePath}ic_dots.png')))),
                    ],
                  ),
              
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  OrderScreen(vehicle: cartItems.first,),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 21),
                          backgroundColor: lightGrey255,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0))),
                      child: const Text("Buy Now"),
                    ),
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

class VehicleOrderCarWidget extends StatefulWidget {
   VehicleOrderCarWidget({
    super.key, required this.vehicle,
  });

  final VehicleModel vehicle;

  @override
  State<VehicleOrderCarWidget> createState() => _VehicleOrderCarWidgetState();
}

class _VehicleOrderCarWidgetState extends State<VehicleOrderCarWidget> {
              var carts = VehiclesData();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 54.0,
            width: 54.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        '${Helper.assetImagePath}vehicles/${widget.vehicle.image}')))),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "${widget.vehicle.vehicle}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20.0),
              ),
              Text(
                "10 stock available",
                style:
                    TextStyle(fontSize: 12.0, color: lightGrey),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
            carts.removeFromCart(widget.vehicle);
            });
          },
          child: Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                          '${Helper.assetImagePath}ic_min.png')))),
        ),
        const SizedBox(width: 14),
         Text("${widget.vehicle.count.toString()}"),
        const SizedBox(width: 14),
         GestureDetector(
          onTap: (){
            setState(() {
            carts.addItemCart(widget.vehicle);
            });
          }, child : 
        Container(
            height: 32.0,
            width: 32.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        '${Helper.assetImagePath}ic_plus.png')))),
    )],
    );
  }
}
