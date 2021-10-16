class TeacherModel {
  String? email, phone, name, uid, image, field, status;

  TeacherModel({
    this.phone,
    this.email,
    this.name,
    this.uid,
    this.image,
    this.field,
    this.status,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
    field = json['field'];
    status = json['status'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uid' : uid,
      'image' : image,
      'field' : field,
      'status' : status,
    };
  }
}