class CatalogModel{

  static List<Item > items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id,
      orElse: null);

  Item getByPos(int pos) => items[pos];
}
// Category:
// phones -> 1
//laptops -> 2
// tablets -> 3
class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final int category;
  int quant;

  Item({required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  required this.quant,
  required this.category});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
      quant: map['quant'],
      category: map['category']
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
    "quant" : quant,
    "category" : category
  };




}

