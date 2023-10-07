
class Users {
  String? fullName;
  String? email;
  String? password;
  String? role;
  String? uuid;
  String? address;

  Users(
      { this.fullName,
        this.email,
        this.password,
        this.role,
        this.uuid,
      this.address
      });

  Users.fromMap(Map<String, dynamic>? data) {
    fullName = data!['fullName'];
    email = data['email'];
    password = data['password'];
    address = data['address'];
    role = data['role'] ;
    uuid = data['uuid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'address': address,
      'role': role,
      'uuid': uuid,
    };
  }
}