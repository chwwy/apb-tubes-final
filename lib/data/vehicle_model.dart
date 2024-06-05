class VehicleModel {
  String? license;
  String? citizenid;
  String? vehicle;
  String? hash;
  String? mods;
  String? plate;
  bool? fakeplate;
  String? garage;
  int? fuel;
  int? engine;
  int? body;
  int? state;
  int? depotprice;
  String? image;
  int? drivingdistance;
  bool? status;
  bool? glovebox;
  bool? trunk;
  int count; // Properti baru untuk menghitung jumlah item
  VehicleModel(
      {
      this.count = 1,
      this.license,
      this.citizenid,
      this.vehicle,
      this.hash,
      this.mods,
      this.plate,
      this.fakeplate,
      this.garage,
      this.fuel,
      this.engine,
      this.body,
      this.state,
      this.depotprice,
      this.image,
      this.drivingdistance,
      this.status,
      this.glovebox,
      this.trunk});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license'] = this.license;
    data['citizenid'] = this.citizenid;
    data['vehicle'] = this.vehicle;
    data['hash'] = this.hash;
    data['mods'] = this.mods;
    data['plate'] = this.plate;
    data['fakeplate'] = this.fakeplate;
    data['garage'] = this.garage;
    data['fuel'] = this.fuel;
    data['engine'] = this.engine;
    data['body'] = this.body;
    data['state'] = this.state;
    data['depotprice'] = this.depotprice;
    data['image'] = this.image;
    data['drivingdistance'] = this.drivingdistance;
    data['status'] = this.status;
    data['glovebox'] = this.glovebox;
    data['trunk'] = this.trunk;
    return data;
  }
}