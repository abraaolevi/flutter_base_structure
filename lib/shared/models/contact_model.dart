class ContactModel {
  String name;
  String phone;
  String photo;

  ContactModel({this.name, this.phone, this.photo});

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    photo = 'https://via.placeholder.com/150';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photo'] = this.photo;

    return data;
  }
}
