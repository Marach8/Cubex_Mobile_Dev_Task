extension MapExtensions<T, S> on Map<T, S>?{

  String mapToString() {
    if (this == null || (this!.isEmpty)) {
      return '';
    }

    return this!.entries.map((entry) => '${entry.key} => ${entry.value}').join(', ');
  }
}