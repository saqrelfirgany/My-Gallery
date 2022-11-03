class UserGalleryModel {
  dynamic images;

  UserGalleryModel({this.images});

  UserGalleryModel.fromJson(Map<String, dynamic> json) {
    images = json['images'];
  }
}
