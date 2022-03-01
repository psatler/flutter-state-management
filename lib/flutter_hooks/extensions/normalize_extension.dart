// https://twitter.com/vandadnp/status/1496800658095288320

extension Normalize on num {
  num normalized(
    num selfRangeMin,
    num selfRangeMax, [
    num normalizedRangeMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) {
    final normalizedDiff = normalizedRangeMax - normalizedRangeMin;
    final selfRangeMaxDiff = selfRangeMax - selfRangeMin;
    final currentNumber = this;

    return normalizedDiff *
            ((currentNumber - selfRangeMin) / selfRangeMaxDiff) +
        normalizedRangeMin;
  }
}
