// we should be working with iterables instead of lists as much as we can

extension AddRemoveItem<T> on Iterable<T> {
  Iterable<T> operator +(T other) => followedBy([other]);

  Iterable<T> operator -(T other) => where((element) => element != other);
}
