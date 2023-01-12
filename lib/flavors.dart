enum Flavor {
  AKASO,
  FUMIYA,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.AKASO:
        return 'Akaso';
      case Flavor.FUMIYA:
        return 'Fumiya';
      default:
        return 'title';
    }
  }
}
