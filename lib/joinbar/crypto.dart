class Crypto {
  Crypto(
      this.iconImage,
      this.name,
      this.price,
      this.graphData
      );

  final String iconImage;
  final String name;
  final double price;
  List<double> graphData;
}