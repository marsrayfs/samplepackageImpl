library standalone_pkg;

class RemoteConfiguration {
  final String color;
  RemoteConfiguration(this.color);

  RemoteConfiguration copyWith({
    required String color,
  }) {
    return RemoteConfiguration(
      color,
    );
  }
}
