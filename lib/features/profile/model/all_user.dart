class UserModel {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final UserName? name;
  final UserAddress? address;
  final String? phone;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] != null
          ? UserName.fromJson(json['name'] as Map<String, dynamic>)
          : null,
      address: json['address'] != null
          ? UserAddress.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name?.toJson(),
      'address': address?.toJson(),
      'phone': phone,
    };
  }

  static List<UserModel> listFromJson(List<dynamic> list) {
    return list
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class UserName {
  final String? firstname;
  final String? lastname;

  UserName({this.firstname, this.lastname});

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'firstname': firstname, 'lastname': lastname};
  }
}

class UserAddress {
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;
  final UserGeoLocation? geolocation;

  UserAddress({this.city, this.street, this.number, this.zipcode, this.geolocation});

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      city: json['city'] as String?,
      street: json['street'] as String?,
      number: json['number'] as int?,
      zipcode: json['zipcode'] as String?,
      geolocation: json['geolocation'] != null
          ? UserGeoLocation.fromJson(json['geolocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'geolocation': geolocation?.toJson(),
    };
  }
}

class UserGeoLocation {
  final double? lat;
  final double? long;

  UserGeoLocation({this.lat, this.long});

  factory UserGeoLocation.fromJson(Map<String, dynamic> json) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return UserGeoLocation(
      lat: parseDouble(json['lat']),
      long: parseDouble(json['long']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'long': long};
  }
}
