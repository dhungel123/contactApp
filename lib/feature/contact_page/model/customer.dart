
class Customer {
  int? id;
  String? name;
  String? phone;
  String? city;
  String? email;

  Customer(
      {this.id,
        this.name,
        this.phone,
        this.city,
        this.email});

  factory Customer.fromJson(Map<String, dynamic> parsedJson) {
    return Customer(
        id: parsedJson['id'],
        name: parsedJson['name'],
        phone: parsedJson['phone'],
        city: parsedJson['city'],
        email: parsedJson['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['city'] = city;
    data['email'] = email;
    return data;
  }

  // the Customer.fromMap() factory constructor can be used to create a Customer
  // object from a map.

  //The Customer.fromMap() factory constructor then creates a new Customer object
  // and sets the properties of the object to the values in the map.
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      city: map['city'],
    );
  }
}
