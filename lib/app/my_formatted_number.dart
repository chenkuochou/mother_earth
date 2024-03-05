String myFormattedNumber(double number) {
  if (number % 1 == 0) {
    return number.toInt().toString();
  } else {
    return number.toStringAsFixed(1);
  }
}
