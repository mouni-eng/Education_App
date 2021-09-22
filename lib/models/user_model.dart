class LogInModel {
  String? email, phone, name, uid, image;

  LogInModel({
    this.phone,
    this.email,
    this.name,
    this.uid,
    this.image,
  });

  LogInModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uid' : uid,
      'image' : image,
    };
  }
}