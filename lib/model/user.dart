class User {
  int sno;
  String id;
  String name;
  String phone;
  String email;
  // String aadhar;
  // String drivingLicense;
  // String pan;
  // String brand;
  // String model;
  // String year;
  // String licensePlate;
  // String registrationPlate;
  // String vehicleIdentificationNumber;
  // String chasisNumber;
  // String insuranceNumber;
  // String insuranceExpiryDate;
  // String vehicleInspection;
  // String vehicleInspectionExpiryDate;
  // String status;
  // DateTime createdAt;
  // DateTime updatedAt;
  // String? location;

  User({
    required this.sno,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    // required this.aadhar,
    // required this.drivingLicense,
    // required this.pan,
    // required this.brand,
    // required this.model,
    // required this.year,
    // required this.licensePlate,
    // required this.registrationPlate,
    // required this.vehicleIdentificationNumber,
    // required this.chasisNumber,
    // required this.insuranceNumber,
    // required this.insuranceExpiryDate,
    // required this.vehicleInspection,
    // required this.vehicleInspectionExpiryDate,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
    // this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sno: json['Sno'],
      id: json['ID'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      // aadhar: json['aadhar'],
      // drivingLicense: json['drivingLicense'],
      // pan: json['pan'],
      // brand: json['brand'],
      // model: json['model'],
      // year: json['year'],
      // licensePlate: json['licensePlate'],
      // registrationPlate: json['registrationPlate'],
      // vehicleIdentificationNumber: json['vehicleIdentificationNumber'],
      // chasisNumber: json['chasisNumber'],
      // insuranceNumber: json['insuranceNumber'],
      // insuranceExpiryDate: json['insuranceExpiryDate'],
      // vehicleInspection: json['vehicleInspection'],
      // vehicleInspectionExpiryDate: json['vehicleInspectionExpiryDate'],
      // status: json['status'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      // location: json['Location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Sno': sno,
      'ID': id,
      'name': name,
      'phone': phone,
      'email': email,
      // 'aadhar': aadhar,
      // 'drivingLicense': drivingLicense,
      // 'pan': pan,
      // 'brand': brand,
      // 'model': model,
      // 'year': year,
      // 'licensePlate': licensePlate,
      // 'registrationPlate': registrationPlate,
      // 'vehicleIdentificationNumber': vehicleIdentificationNumber,
      // 'chasisNumber': chasisNumber,
      // 'insuranceNumber': insuranceNumber,
      // 'insuranceExpiryDate': insuranceExpiryDate,
      // 'vehicleInspection': vehicleInspection,
      // 'vehicleInspectionExpiryDate': vehicleInspectionExpiryDate,
      // 'status': status,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
      // 'Location': location,
    };
  }
}
