extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    // square brackets to indicate it is positional optional parameter
    // https://stackoverflow.com/questions/13264230/what-is-the-difference-between-named-and-positional-parameters-in-dart
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      )
          .where(
            (e) => e != null,
          )
          .cast();
}

void testIt() {
  final values = [1, 2, null, 3]; // List<int?> values

  final nonNullableValues =
      values.compactMap(); // Iterable<int> nonNullableValues

  final nonNullableValuesWithCallback = values.compactMap((e) {
    if (e != null && e > 10) {
      return e;
    }

    return null;
  }); // Iterable<int> nonNullableValues
}
