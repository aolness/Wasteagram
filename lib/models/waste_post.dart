class WastePost {

  WastePost();

  WastePost.fill(
    this.imageURL,
    this.quantitiy,
    this.latitude,
    this.longitude,
    this.date);

  late final String imageURL;
  late final int quantitiy;
  late final double latitude;
  late final double longitude;
  late final DateTime date;

  @override
  String toString() {
    return 'Quantity: $quantitiy, Date: $date, Latitude: $latitude, Longitude: $longitude, URL: $imageURL';
  }
  
}