///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ProductModel {
/*
{
  "name": "Red-eared Slider",
  "latin_name": "Trachemys scripta elegans",
  "animal_type": "Reptile",
  "active_time": "Diurnal",
  "length_min": "0.42",
  "length_max": "0.92",
  "weight_min": "1.5",
  "weight_max": "2",
  "lifespan": "20",
  "habitat": "Freshwater ponds and streams",
  "diet": "Fish, mollusks, and insects",
  "geo_range": "Southern and Midwestern United States",
  "image_link": "https://upload.wikimedia.org/wikipedia/commons/9/96/RedEaredSlider05.jpg",
  "id": 149
}
*/

  String? name;
  String? latinName;
  String? animalType;
  String? activeTime;
  String? lengthMin;
  String? lengthMax;
  String? weightMin;
  String? weightMax;
  String? lifespan;
  String? habitat;
  String? diet;
  String? geoRange;
  String? imageLink;
  int? id;

  ProductModel({
    this.name,
    this.latinName,
    this.animalType,
    this.activeTime,
    this.lengthMin,
    this.lengthMax,
    this.weightMin,
    this.weightMax,
    this.lifespan,
    this.habitat,
    this.diet,
    this.geoRange,
    this.imageLink,
    this.id,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    latinName = json['latin_name']?.toString();
    animalType = json['animal_type']?.toString();
    activeTime = json['active_time']?.toString();
    lengthMin = json['length_min']?.toString();
    lengthMax = json['length_max']?.toString();
    weightMin = json['weight_min']?.toString();
    weightMax = json['weight_max']?.toString();
    lifespan = json['lifespan']?.toString();
    habitat = json['habitat']?.toString();
    diet = json['diet']?.toString();
    geoRange = json['geo_range']?.toString();
    imageLink = json['image_link']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['latin_name'] = latinName;
    data['animal_type'] = animalType;
    data['active_time'] = activeTime;
    data['length_min'] = lengthMin;
    data['length_max'] = lengthMax;
    data['weight_min'] = weightMin;
    data['weight_max'] = weightMax;
    data['lifespan'] = lifespan;
    data['habitat'] = habitat;
    data['diet'] = diet;
    data['geo_range'] = geoRange;
    data['image_link'] = imageLink;
    data['id'] = id;
    return data;
  }
}