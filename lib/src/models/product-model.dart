
class ProductModel {
  String id;
  String title;
  double price;
  bool available;
  String urlPhoto;

  ProductModel(
    {this.id, this.title = '', this.price = 0.0, this.available = true, this.urlPhoto}
    );

//REgressa uma nova instancia
  ProductModel.fromJson(Map<String, dynamic> json) {
    id        = json['id'];
    title     = json['title'];
    price     = json['price'];
    available = json['available'];
    urlPhoto  = json['urlPhoto'];
  }

// Transforma o modelo em um Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']        = this.id;
    data['title']     = this.title;
    data['price']     = this.price;
    data['available'] = this.available;
    data['urlPhoto']  = this.urlPhoto;

    return data;
  }
}