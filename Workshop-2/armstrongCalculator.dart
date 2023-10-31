import 'dart:math';

void main() {
  int n = 12;
  bool result = checkIfArmstrong(n);
  print(result);
}

bool checkIfArmstrong(int nbr) {
  if (nbr == computeDigits(getDigits(nbr)))
    return true;
  return false;
}

List<int> getDigits(int nbr) {
  List<int> list = [];

  while (nbr != 0) {
    list.add((nbr % 10));
    nbr = (nbr / 10).floor();
  }
  return list;
}

int computeDigits(List<int> digits) {
  int total, l;

  l = digits.length;
  total = 0;
  for (int i = 0; i < l; i++) {
    total += pow(digits[i], l) as int;
  }
  return total;
}