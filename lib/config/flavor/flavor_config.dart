enum FlavorType { regular, premium }

class FlavorValues {
  final String titleApp;

  const FlavorValues({this.titleApp = "Regular App"});
}

class FlavorConfig {
  final FlavorType flavorType;
  final FlavorValues flavorValues;

  static FlavorConfig? _instance;

  FlavorConfig({
    this.flavorType = FlavorType.regular,
    this.flavorValues = const FlavorValues(),
  }) {
    _instance = this;
  }

  static FlavorConfig get instance => _instance ?? FlavorConfig();
}
