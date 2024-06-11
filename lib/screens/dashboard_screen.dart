import 'package:apb5/data/vehicle_model.dart';
import 'package:apb5/data/vehicles_data.dart';
import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/detail_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:apb5/themes/values_manager/values_manager.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['All Vehicle'];
   List<VehicleModel> listVehicle = [];


  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return GridView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: ValuesManager.size36,
              mainAxisSpacing: 24.0),
              children: List.generate(listVehicle.length, (index) {
                return  YellowNissanCard(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ));
            }, vehicle: listVehicle[index],);
             
                   
                
    })
       
          
        ); 
      case 1:
        return GridView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: ValuesManager.size36,
              mainAxisSpacing: 24.0),
              children: List.generate(listVehicle.length, (index) {
                return  YellowNissanCard(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ));
            }, vehicle: listVehicle[index],);
             
                   
                
    })
       
          
        );      
      case 2:
        return GridView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: ValuesManager.size36,
              mainAxisSpacing: 24.0),
              children: List.generate(20, (index) {
                if(index % 2 == 0 ){
                  return  WhiteNissanCard(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ));
                });
                }else{
                   return  YellowNissanCard(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ));
            }, vehicle: VehicleModel(),);
                   
                
    }})
          // children: [
          //   WhiteNissanCard(onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => DetailScreen(),
          //         ));
          //   }),
          //      YellowNissanCard(onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => DetailScreen(),
          //         ));
          //   }),
            // YellowNissanCard(),
            // WhiteNissanCard(),
            // YellowNissanCard(),
            // WhiteNissanCard(),
            // YellowNissanCard(),
            // WhiteNissanCard(),
            // YellowNissanCard(),
          
        );      
      default:
        return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     listVehicle =  VehiclesData.getAllData();
    print(listVehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Stack(clipBehavior: Clip.none, children: [
            const CustomHeader(),

            Padding(
              padding: const EdgeInsets.only(top: 230),
              // width: double.infinity,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: ValuesManager.margin39),
                padding: EdgeInsets.symmetric(
                    horizontal: ValuesManager.margin24, vertical: 13.0),
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0), color: greyCard),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                      child: const Text("Iklan",style: TextStyle(
                        color: Colors.white
                      ),),),
                    SizedBox(
                      height: ValuesManager.size8,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 200.0,
                          height: 27.0,
                          color: Colors.black,
                        ),
                        const Positioned(
                          top: -15,
                          child: Text(
                            "Isi disini",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ValuesManager.size4,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 130.0,
                          height: 27.0,
                          color: Colors.black,
                        ),
                        const Positioned(
                          top: -15,
                          child: Text(
                            "banner",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                // margin: EdgeInsets.symmetric(horizontal: ValuesManager.padding38),
              ),
            )
          ]),
          const SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: List.generate(_tabs.length, (index) {
                      return ChoiceChip(
                        showCheckmark: false,
                        side: BorderSide.none,
                        label: Text(
                          _tabs[index],
                          style: TextStyle(
                              color: (_selectedIndex == index)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        selected: _selectedIndex == index,
                        onSelected: (selected) {
                          setState(() {
                            _selectedIndex = selected ? index : _selectedIndex;
                          });
                        },
                        selectedColor:
                            _selectedIndex == index ? darkGrey : null,
                        disabledColor:
                            Colors.grey, // Optional: Customize disabled color
                        // Disable the chip by setting onSelected to null
                        // This will prevent the chip from being selected
                        // onSelected: _selectedIndex == index ? null : (selected) {},
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 23.0, right: 23.0, bottom: 11),
                        child: _buildTabContent()),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

class WhiteNissanCard extends StatelessWidget {
  final Function() onTap;
  const WhiteNissanCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 196.0,
        width: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          '${Helper.assetImagePath}white_nissan_image.png'))),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Nissan GT R35",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ), //14
            const SizedBox(height: 2.0),
            Text(
              "10 stock available",
              style: TextStyle(fontSize: 11.0, color: lightGrey),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$ 10.50",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    '${Helper.assetImagePath}ic_add.png'))),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class YellowNissanCard extends StatelessWidget {
    final Function() onTap;
   YellowNissanCard({
    super.key, required this.onTap, required this.vehicle,
  });

  final VehicleModel vehicle;
  @override
  Widget build(BuildContext context) {
  print(vehicle.image);
    return SizedBox(
      height: 196.0,
      width: 160.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                                  '${Helper.assetImagePath}vehicles/${vehicle.image}'))),
          ),
          const SizedBox(height: 10.0),
           Text(
            "${vehicle.vehicle}",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ), //14
          const SizedBox(height: 2.0),
          Text(
            "10 stock available",
            style: TextStyle(fontSize: 11.0, color: lightGrey),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$ 10.50",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () {
                          var data = VehiclesData();
                          data.addItemCart(vehicle);
                    },
                    child: Container(
                      width: 32.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  '${Helper.assetImagePath}ic_add.png'))),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 287.0,
      decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ValuesManager.size28),
              bottomRight: Radius.circular(ValuesManager.size28)),
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('${Helper.assetImagePath}mask_image.png'))),
      child: Container(
        margin: EdgeInsets.only(top: ValuesManager.margin12),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ValuesManager.margin36,
                  vertical: ValuesManager.margin36),
             
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ValuesManager.margin36,
                  right: ValuesManager.margin36,
                  bottom: ValuesManager.margin28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      const Text(
                          "Hi, Nao",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                          const SizedBox(
                    width: 22.0,
                  ),
                  Container(
                    height: 44.0,
                    width: 44.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                            image: AssetImage(
                                '${Helper.assetImagePath}avatar_image.png'))),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: ValuesManager.margin36,
              ),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0), color: blackChip),
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.search, color: Colors.white,),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Expanded(child: Text("Search",style: TextStyle(
                      color: Colors.white
                    ),)),
                    Container(
                        height: 44.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(
                                    '${Helper.assetImagePath}ic_filter.png')))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
