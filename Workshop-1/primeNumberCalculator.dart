import 'dart:math';

void main() {
  int nbr = 99;
  printPrimeNumbers(nbr);
}

void printPrimeNumbers(int nbr) {
  for (int i = 1; i < nbr; i++) {
    if (primeNumber(i)) print(i);
  }
}

bool primeNumber(int nbr) {
  if (nbr <= 1) return false;

  int i = 2;
  while (i <= sqrt(nbr)) {
    if (nbr % i == 0) return false;
    i++;
  }
  return true;
}
