import 'package:apb5/data/vehicle_model.dart';
class VehiclesData {

  static List<VehicleModel>  cartItems = [];

   List<VehicleModel> getCart(){
      return cartItems;
  }

   addItemCart(VehicleModel item){
    
    final existingProduct = cartItems.firstWhere(
        (itemOnList) => itemOnList.vehicle == item.vehicle,
        orElse: () => VehicleModel(vehicle: ''),
      );

      if (existingProduct.vehicle != '') {
        existingProduct.count += 1;
      } else {
        cartItems.add(item);
      }

     print(cartItems);
  }
removeFromCart(VehicleModel item) {
      final existingProduct = cartItems.firstWhere(
        (itemOnList) => itemOnList.vehicle == item.vehicle,
        orElse: () => VehicleModel(vehicle: ''),
      );

      if (existingProduct.vehicle != '') {
        if (existingProduct.count > 1) {
          existingProduct.count -= 1;
        } else {
          cartItems.remove(existingProduct);
        }
      }
  }


static List<VehicleModel> getAllData(){

    return [
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "sadler",
    hash: "-599568815",
    mods: '{"plate":"PLT123"}',
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'pickup.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "yosemite",
    hash: "1871995513",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'convertible.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "blista",
    hash: "-344943009",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'minivan.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "prairie",
    hash: "-1450650718",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'hatckback.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "cheetah",
    hash: "-1311154784",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'sports.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "flatbed",
    hash: "1353720154",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'truck.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "toros",
    hash: "-1168952148",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'suv.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "akuma",
    hash: "1672195559",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'motorcycle.png'

  ),
  VehicleModel(
    license: "license2:bac98ea18022df59b9674fe667eadfef0390c660",
    citizenid: "H6VJPNF3",
    vehicle: "kuruma",
    hash: "-1372848492",
    mods: "",
    plate: "PLT123",
    fakeplate: null,
    garage: "Garage A",
    fuel: 100,
    engine: 1000,
    body: 1000,
    state: 1,
    depotprice: 0,
    drivingdistance: null,
    status: null,
    glovebox: null,
    trunk: null,
        image: 'coupe.png'

  ),
];

} 
}

